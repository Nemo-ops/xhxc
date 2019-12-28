package com.fh.entity.system;

import com.fh.entity.Page;

/**
 * 
* 类名称：用户
* 类描述： 
* @author FH QQ 313596790[青苔]
* 作者单位： 
* 联系方式：
* 创建时间：2014年6月28日
* @version 1.0
 */
public class User {
	private String USER_ID;		//用户id
	private String USERNAME;	//用户名
	private String PASSWORD; 	//密码
	private String NAME;		//姓名
	private String RIGHTS;		//权限
	private String ROLE_ID;		//角色id
	private String LAST_LOGIN;	//最后登录时间
	private String IP;			//用户登录ip地址
	private String STATUS;		//状态
	private Role role;			//角色对象
	private Page page;			//分页对象
	private String SKIN;		//皮肤
	private String EMAIL;
	private String PHONE;
	private String PROVINCE;
	private String CITY;
	private String ADDRESS;
	private String PHOTO;
	private String GROUP;
	private String REG_DATE;
	private String EDU_BG;
	private String MAJOR;

	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String EMAIL) {
		this.EMAIL = EMAIL;
	}

	public String getPHONE() {
		return PHONE;
	}

	public void setPHONE(String PHONE) {
		this.PHONE = PHONE;
	}

	public String getPROVINCE() {
		return PROVINCE;
	}

	public void setPROVINCE(String PROVINCE) {
		this.PROVINCE = PROVINCE;
	}

	public String getCITY() {
		return CITY;
	}

	public void setCITY(String CITY) {
		this.CITY = CITY;
	}

	public String getADDRESS() {
		return ADDRESS;
	}

	public void setADDRESS(String ADDRESS) {
		this.ADDRESS = ADDRESS;
	}

	public String getPHOTO() {
		return PHOTO;
	}

	public void setPHOTO(String PHOTO) {
		this.PHOTO = PHOTO;
	}

	public String getGROUP() {
		return GROUP;
	}

	public void setGROUP(String GROUP) {
		this.GROUP = GROUP;
	}

	public String getREG_DATE() {
		return REG_DATE;
	}

	public void setREG_DATE(String REG_DATE) {
		this.REG_DATE = REG_DATE;
	}

	public String getEDU_BG() {
		return EDU_BG;
	}

	public void setEDU_BG(String EDU_BG) {
		this.EDU_BG = EDU_BG;
	}

	public String getMAJOR() {
		return MAJOR;
	}

	public void setMAJOR(String MAJOR) {
		this.MAJOR = MAJOR;
	}
	
	public String getSKIN() {
		return SKIN;
	}
	public void setSKIN(String sKIN) {
		SKIN = sKIN;
	}
	
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String uSER_ID) {
		USER_ID = uSER_ID;
	}
	public String getUSERNAME() {
		return USERNAME;
	}
	public void setUSERNAME(String uSERNAME) {
		USERNAME = uSERNAME;
	}
	public String getPASSWORD() {
		return PASSWORD;
	}
	public void setPASSWORD(String pASSWORD) {
		PASSWORD = pASSWORD;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getRIGHTS() {
		return RIGHTS;
	}
	public void setRIGHTS(String rIGHTS) {
		RIGHTS = rIGHTS;
	}
	public String getROLE_ID() {
		return ROLE_ID;
	}
	public void setROLE_ID(String rOLE_ID) {
		ROLE_ID = rOLE_ID;
	}
	public String getLAST_LOGIN() {
		return LAST_LOGIN;
	}
	public void setLAST_LOGIN(String lAST_LOGIN) {
		LAST_LOGIN = lAST_LOGIN;
	}
	public String getIP() {
		return IP;
	}
	public void setIP(String iP) {
		IP = iP;
	}
	public String getSTATUS() {
		return STATUS;
	}
	public void setSTATUS(String sTATUS) {
		STATUS = sTATUS;
	}
	
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	public Page getPage() {
		if(page==null)
			page = new Page();
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}

	@Override
	public String toString() {
		return "User{" +
				"USER_ID='" + USER_ID + '\'' +
				", USERNAME='" + USERNAME + '\'' +
				", PASSWORD='" + PASSWORD + '\'' +
				", NAME='" + NAME + '\'' +
				", RIGHTS='" + RIGHTS + '\'' +
				", ROLE_ID='" + ROLE_ID + '\'' +
				", LAST_LOGIN='" + LAST_LOGIN + '\'' +
				", IP='" + IP + '\'' +
				", STATUS='" + STATUS + '\'' +
				", role=" + role +
				", page=" + page +
				", SKIN='" + SKIN + '\'' +
				", EMAIL='" + EMAIL + '\'' +
				", PHONE='" + PHONE + '\'' +
				", PROVINCE='" + PROVINCE + '\'' +
				", CITY='" + CITY + '\'' +
				", ADDRESS='" + ADDRESS + '\'' +
				", PHOTO='" + PHOTO + '\'' +
				", GROUP='" + GROUP + '\'' +
				", REG_DATE='" + REG_DATE + '\'' +
				", EDU_BG='" + EDU_BG + '\'' +
				", MAJOR='" + MAJOR + '\'' +
				'}';
	}
}
