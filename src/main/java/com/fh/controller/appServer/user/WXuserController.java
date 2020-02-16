package com.fh.controller.appServer.user;

import com.fh.constant.RoleTypeEnum;
import com.fh.controller.base.BaseController;
import com.fh.entity.app.ResponseModel;
import com.fh.service.system.user.impl.UserService;
import com.fh.util.*;
import net.sf.json.JSONObject;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping(value = "/appUser")
public class WXuserController extends BaseController {
    @Resource(name = "userService")
    private UserService userService;

    @RequestMapping("/register")
    @ResponseBody
    public Object WX_register(@RequestBody PageData pd){
        try{
            if (Tools.isEmpty(pd.getString("phone"))||
                    Tools.isEmpty(pd.getString("password"))||
                    Tools.isEmpty(pd.getString("phoneCode"))) {
                return ResponseModel.buildParameterError();
            }
            if(userService.findByPhone(pd)!=null){//不为空，手机号存在返回错误
                return ResponseModel.buildPhoneExistError();
                /**该封装结果返回为json
                 * {
                 *     "code": 4000,
                 *     "message": "手机号已存在.",
                 *     "time": "2020-02-16 16:20:07"
                 * }
                 */
            }

            //验证短信验证码是否匹配，若不匹配，直接返回验证码错误
            Map<String, String> verify_map = new HashMap<>();
            verify_map.put("mobilePhoneNumber", pd.getString("phone"));
            if (!Objects.equals("ok", ((Map<String, String>) JSONObject.fromObject(BombUtils.sendPost("https://api2.bmob.cn/1/verifySmsCode/" + pd.getString("phoneCode"), JSONObject.fromObject(verify_map).toString()))).get("msg"))) {
                return ResponseModel.buildPhoneCodeError();
                /**
                 * {
                 *     "code": 5002,
                 *     "message": "短信验证码错误.",
                 *     "time": "2020-02-16 16:21:09"
                 * }
                 */
            }

            //测试密码 1 加密码 A69JpUGEW6v0R+wfvYtAmQ==
            String PASSWORD = AesUtil.aesDecrypt(pd.getString("password")) ;//密码解密
            //取当前时间+10位随机数字，当做用户名
            String USERNAME = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + PayUtil.createCode(10);

            pd.put("USERNAME",USERNAME);//用户名
            pd.put("PHONE",pd.getString("phone"));
            pd.put("NAME",pd.getString("name"));
            pd.put("PASSWORD",new SimpleHash("SHA-1",USERNAME,PASSWORD).toString()); //密码加密
            pd.put("USER_ID", this.get32UUID()); //32位uuid作为userID
            String ROLE_TYPE = pd.getString("roleType");
            String ROLE_ID="";
            switch (ROLE_TYPE){
                case "1":
                    ROLE_ID = RoleTypeEnum.HELPER.getCode();
                    break;
                case "2":
                    ROLE_ID = RoleTypeEnum.SCHOOL.getCode();
                    break;
                case "3":
                    ROLE_ID = RoleTypeEnum.GROUP.getCode();
                    break;
                default:
                    break;
            }
            pd.put("ROLE_ID",ROLE_ID);//用户角色

            //其他默认值
            pd.put("EMAIL", "");
            pd.put("LAST_LOGIN", "");				//最后登录时间
            pd.put("IP", "");						//IP
            pd.put("STATUS", "0");					//状态
            pd.put("SKIN", "default");
            pd.put("RIGHTS", "");

            try{
                userService.saveU(pd);
                return ResponseModel.buildOk(pd.getString("USER_ID"));//将UserID返回客户端
                /**
                 * {
                 *     "code": 1,
                 *     "message": "ok",
                 *     "time": "2020-02-16 16:24:07",
                 *     "result": "58fee57094e94457b8483076c26d0209"
                 * }
                 */
            }catch (Exception e){
                return ResponseModel.buildRegistError();
            }
        }catch (Exception e){
            return ResponseModel.buildServiceError();
        }
    }

    @RequestMapping("/login")
    @ResponseBody
    public Object login(@RequestBody PageData pd) {
        try {
            if (Tools.isEmpty(pd.getString("phone"))
                    || Tools.isEmpty(pd.getString("password"))) {
                return ResponseModel.buildParameterError();
            }
            PageData user = userService.findByPhone(pd);
            if(user!=null){
                String password = new SimpleHash("SHA-1", user.getString("USERNAME"), AesUtil.aesDecrypt(pd.getString("password"))).toString(); //密码加密
                if(password.equals(user.getString("PASSWORD"))){//说明密码正确
                    //去除敏感信息
                    user.remove("PASSWORD");
                    user.remove("RIGHTS");
                    return ResponseModel.buildOk(user);//将用户信息返回
                }else{
                    return ResponseModel.buildErrorPassword();
                }
            }else{
                // 没有找到用户信息
                return ResponseModel.buildNotFoundUserError();
            }
        } catch (Exception e) {
            return ResponseModel.buildServiceError();
        }
    }

    @RequestMapping("/changePassword")
    @ResponseBody
    public Object changePassword(@RequestBody PageData pd) {
        try{
            PageData user = new PageData();
            //如果手机号、密码、验证码、手机号不存在则返回参数错误
            if (Tools.isEmpty(pd.getString("phone"))
                    || Tools.isEmpty(pd.getString("password"))||Tools.isEmpty(pd.getString("phoneCode"))
                    ||(user = userService.findByPhone(pd)) == null){
                return ResponseModel.buildParameterError();
            }
            //验证短信验证码是否匹配，若不匹配，直接返回验证码错误
            Map<String, String> verify_map = new HashMap<>();
            verify_map.put("mobilePhoneNumber", pd.getString("phone"));
            if (!Objects.equals("ok", ((Map<String, String>) JSONObject.fromObject(BombUtils.sendPost("https://api2.bmob.cn/1/verifySmsCode/" + pd.getString("phoneCode"), JSONObject.fromObject(verify_map).toString()))).get("msg"))) {
                return ResponseModel.buildPhoneCodeError();
            }

            String password = new SimpleHash("SHA-1", user.getString("USERNAME"), pd.getString("password")).toString(); //密码加密
            pd.put("PASSWORD", password);
            pd.put("USER_ID", user.getString("USER_ID"));
            userService.changePassword(pd);
            return ResponseModel.buildOk();
        }catch (Exception e){
            return ResponseModel.buildServiceError();
        }
    }

    @RequestMapping("/deleteUser")
    @ResponseBody
    public Object deleteUser(@RequestBody PageData pd) {
        try{
            userService.deleteU(pd);
            return ResponseModel.buildOk();
        }catch (Exception e){
            return ResponseModel.buildServiceError();
        }
    }
}
