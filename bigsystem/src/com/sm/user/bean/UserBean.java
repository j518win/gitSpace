package com.sm.user.bean;

public class UserBean {
	
	private String id;			// ���
	private String loginId;		// ����
	private String oldPassWd;	// ������
	private String passWord;	// ����
	private String userType;	// �û�����
	private String userName;	// �û�����
	private String adminId;		// �����˹���	
	private String contactNo;	// ��ϵ��ʽ
	private String cityId;		// ����
	private String company;		// ��˾
	private String remark;		// ��ע
	private String adminFlag; 	// Ȩ�ޱ�־
	private String status;		// ״̬
	
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
