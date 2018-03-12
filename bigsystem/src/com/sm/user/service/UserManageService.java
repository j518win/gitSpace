package com.sm.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.sm.user.bean.UserBean;
import com.sm.user.dao.UserManageDao;

@Component
public class UserManageService {
	
	@Resource(name="userManageDao")
	private UserManageDao userManageDao;
	
	public UserBean qryUser(String loginId, String passWord) throws Exception{
		return userManageDao.qryUser(loginId, passWord);
	}
	
	public int modifyPassWd(UserBean modifyUser) throws Exception{
		return userManageDao.modifyPassWd(modifyUser);
	}
	
	public List<UserBean> qryUserList(UserBean qryCond) throws Exception{
		return userManageDao.qryUserList(qryCond);
	}
	
	public int modifyUser(UserBean modifyUser) throws Exception{
		return userManageDao.modifyUser(modifyUser);
	}
	
	public void createUser(UserBean addUser) throws Exception{
		userManageDao.createUser(addUser);
	}
	
	public int modifyUserStatus(UserBean addUser) throws Exception{
    	return userManageDao.modifyUserStatus(addUser);
    }
	
    public List createSeq() throws Exception{
    	return userManageDao.createSeq();
    }
    
    public List getUserMenu(String userId){
		List list = userManageDao.getUserMenu(userId);
		return list;
	}
    
    public List queryExistRole(String userId){
		List list = userManageDao.queryExistRole(userId);
		return list;
	}
    
    public List queryNotExistRole(String userId){
		List list = userManageDao.queryNotExistRole(userId);
		return list;
	}
    
    public int setUserRole(String roleIds,String userId,String operator){
		int i = userManageDao.setUserRole(roleIds,userId,operator);
		return i;
	}
}
