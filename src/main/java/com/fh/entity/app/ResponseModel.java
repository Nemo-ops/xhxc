package com.fh.entity.app;

import com.fh.util.DateUtil;

import java.io.Serializable;

/**
 * @version 1.0.0
 */
public class ResponseModel<M> implements Serializable {
    // 成功
    public static final int SUCCEED = 1;
    // 未知错误
    public static final int ERROR_UNKNOWN = 0;

    // 用户不存在
    public static final int USER_NOT_FOUND=3001;



    // 密码错误
    public static final int ERROR_PASSWORD=3002;

    // 请求参数错误
    public static final int ERROR_PARAMETERS = 4001;
    // 手机号已存在
    public static final int ERROR_PHONE = 4000;

    // 服务器错误
    public static final int ERROR_SERVICE = 5001;

    // 短信验证码错误
    public static final int ERROR_PHONE_CODE = 5002;

    // 注册失败
    public static final int ERROR_REGIST = 5003;


    private int code;

    private String message;

    private String time = DateUtil.getTime();

    private M result;

    public ResponseModel() {
        code = 1;
        message = "ok";
    }

    public ResponseModel(M result) {
        this();
        this.result = result;
    }

    public ResponseModel(int code, String message) {
        this.code = code;
        this.message = message;
    }

    public ResponseModel(int code, String message, M result) {
        this.code = code;
        this.message = message;
        this.result = result;
    }

    public int getCode() {
        return code;
    }

    public boolean isSucceed() {
        return code == SUCCEED;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public M getResult() {
        return result;
    }

    public void setResult(M result) {
        this.result = result;
    }

    public static <M> ResponseModel<M> buildOk() {
        return new ResponseModel<M>();
    }

    public static <M> ResponseModel<M> buildOk(M result) {
        return new ResponseModel<M>(result);
    }

    public static <M> ResponseModel<M> buildUnknowError() {
        return new ResponseModel<M>(ERROR_UNKNOWN, "Unknow Error.");
    }

    public static <M> ResponseModel<M> buildParameterError() {
        return new ResponseModel<M>(ERROR_PARAMETERS, "Parameters Error.");
    }

    public static <M> ResponseModel<M> buildPhoneExistError() {
        return new ResponseModel<M>(ERROR_PHONE, "手机号已存在.");
    }

    public static <M> ResponseModel<M> buildServiceError() {
        return new ResponseModel<M>(ERROR_SERVICE, "Service Error.");
    }

    public static <M> ResponseModel<M> buildPhoneCodeError() {
        return new ResponseModel<M>(ERROR_PHONE_CODE, "短信验证码错误.");
    }

    public static <M> ResponseModel<M> buildRegistError() {
        return new ResponseModel<M>(ERROR_REGIST, "注册失败.");
    }

    public static <M> ResponseModel<M> buildNotFoundUserError() {
        return new ResponseModel<M>(USER_NOT_FOUND, "用户不存在.");
    }

    public static <M> ResponseModel<M> buildErrorPassword() {
        return new ResponseModel<M>(ERROR_PASSWORD, "密码错误.");
    }




}