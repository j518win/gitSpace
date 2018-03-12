package com.sm.user.bean;

public class UserBean {
	
	private String id;			// 编号
	private String loginId;		// 工号
	private String oldPassWd;	// 旧密码
	private String passWord;	// 密码
	private String userType;	// 用户类型
	private String userName;	// 用户名称
	private String adminId;		// 责任人工号	
	private String contactNo;	// 联系方式
	private String cityId;		// 地市
	private String company;		// 公司
	private String remark;		// 备注
	private String adminFlag; 	// 权限标志
	private String status;		// 状态
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAdminFlag() {
		return adminFlag;
	}
	public void setAdminFlag(String adminFlag) {
		this.adminFlag = adminFlag;
	}
	public String getOldPassWd() {
		return oldPassWd;
	}
	public void setOldPassWd(String oldPassWd) {
		this.oldPassWd = oldPassWd;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getContactNo() {
		return contactNo;
	}
	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}
	public String getCityId() {
		return cityId;
	}
	public void setCityId(String cityId) {
		this.cityId = cityId;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
}
