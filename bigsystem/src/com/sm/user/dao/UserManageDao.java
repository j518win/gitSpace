package com.sm.user.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.common.CommUtil;
import com.core.BaseDao;
import com.sm.user.bean.UserBean;

@Component
public class UserManageDao extends BaseDao{
    
    public UserBean qryUser(String loginId, String passWord ) throws Exception{
    	UserBean qryCondition = new UserBean();
    	qryCondition.setLoginId(loginId);
    	qryCondition.setPassWord(passWord);
    	return (UserBean)getSqlMapClientTemplate().queryForObject("usermanage.qryUser", qryCondition);
    }
    
    public int modifyPassWd(UserBean modifyUser) throws Exception{
		return getSqlMapClientTemplate().update("usermanage.updatePassWd", modifyUser);
	}
    
    @SuppressWarnings("unchecked")
	public List<UserBean> qryUserList(UserBean qryCond) throws Exception{
    	return (List<UserBean>)getSqlMapClientTemplate().queryForList("usermanage.qryUserList", qryCond);
    }
    
    public int modifyUser(UserBean modifyUser) throws Exception{
    	return getSqlMapClientTemplate().update("usermanage.updateUser", modifyUser);
    }
    
    public void createUser(UserBean createUser) throws Exception{
    	getSqlMapClientTemplate().insert("usermanage.createUser", createUser);
    }
    
    public int modifyUserStatus(UserBean addUser) throws Exception{
    	return getSqlMapClientTemplate().delete("usermanage.modifyUserStatus", addUser);
    }
    
    public List createSeq() throws Exception{
    	return getSqlMapClientTemplate().queryForList("usermanage.maxUserId");
    }
    
    public List getUserMenu(String userId) {
		return getSqlMapClientTemplate().queryForList("usermanage.querymenu",userId);
	}
    
    public List queryExistRole(String userId) {
		return getSqlMapClientTemplate().queryForList("usermanage.existRole",userId);
	}
    
    public List queryNotExistRole(String userId) {
		return getSqlMapClientTemplate().queryForList("usermanage.notExistRole",userId);
	}
    
    public int setUserRole(String roleIds,String userId,String operator){
		try {
			if ("".equals(roleIds)){
				getSqlMapClientTemplate().delete("usermanage.deleteUserRole", userId);
				return 1;
			}
			getSqlMapClientTemplate().delete("usermanage.deleteUserRole", userId);
			String roleId[] = roleIds.split("#");
			int len = roleId.length;
			List maxIdList = getSqlMapClientTemplate().queryForList("usermanage.getMaxUserRole");
			String maxId = (String) maxIdList.get(0);
			Map map;
			
			getSqlMapClientTemplate().getSqlMapClient().startBatch();
			for(int i=1;i<=len;i++){
				map=new HashMap();
				map.put("id", new CommUtil().addLing((Integer.parseInt(maxId)+i)+"",6));
				map.put("roleId", roleId[i-1]);
				map.put("userId", userId);
				map.put("operator", operator);
				getSqlMapClientTemplate().getSqlMapClient().insert("usermanage.addUserRole", map);
			}
			getSqlMapClientTemplate().getSqlMapClient().executeBatch();  
			
			return 1;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		} finally{  
		}  
		//return 1;
	}
}
