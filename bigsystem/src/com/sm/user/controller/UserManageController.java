package com.sm.user.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.CommUtil;
import com.sm.user.bean.UserBean;
import com.sm.user.service.UserManageService;

@Controller
@RequestMapping(value = "user/")
public class UserManageController {

	@Resource(name = "userManageService")
	private UserManageService userManageService;

	@SuppressWarnings("finally")
	@RequestMapping(value = "modifyPassWd.do")
	public ModelAndView modifyPassWd(HttpServletRequest request,
			HttpServletResponse response) {
		ModelMap modelMap = new ModelMap();

		UserBean modifyUser = (UserBean) request.getSession().getAttribute(
				"curUser");
		modifyUser.setOldPassWd(request.getParameter("oldPassWd"));
		modifyUser.setPassWord(request.getParameter("newPassWd"));

		try {
			int updateFlag = userManageService.modifyPassWd(modifyUser);
			if (1 == updateFlag) {
				modelMap.put("msgInfo", "密码修改成功！");
			} else {
				modelMap.put("msgInfo", "旧密码输入错误，请重试！");
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("msgInfo", "密码修改失败，请稍后再试！");
		} finally {
			return new ModelAndView("web/user/modifyPassWd", modelMap);
		}
	}

	@SuppressWarnings("finally")
	@RequestMapping(value = "userManage.do")
	public ModelAndView userManage(HttpServletRequest request,
			HttpServletResponse response) {
		ModelMap modelMap = new ModelMap();
		String qryStaffId = request.getParameter("qryStaffId");
		String qryCityId = request.getParameter("qryCityId");
		UserBean qryCond = new UserBean();
		qryCond.setLoginId(qryStaffId);
		qryCond.setCityId(qryCityId);
		modelMap.put("qryStaffId", qryStaffId);
		modelMap.put("qryCityId", qryCityId);
		try {
			UserBean loginUser = (UserBean) request.getSession().getAttribute(
					"curUser");
			if ("0".equals(loginUser.getAdminFlag())) {
				List<UserBean> userList = userManageService.qryUserList(qryCond);
				modelMap.put("userList", userList);
				modelMap.put("msgInfo", "success");
			} else {
				modelMap.put("msgInfo", "noAccess");
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("msgInfo", "fail");
		} finally {
			return new ModelAndView("web/user/userManage", modelMap);
		}
	}

	@RequestMapping(value = "resetPassWd.do")
	public void resetPassWd(HttpServletRequest request,
			HttpServletResponse response) {
		String staffId = request.getParameter("staffId");
		UserBean modifyUser = new UserBean();
		String msgInfo = "";
		try {
			modifyUser.setLoginId(staffId);
			modifyUser.setPassWord("123456");
			int updateFlag = userManageService.modifyPassWd(modifyUser);
			if(1 == updateFlag){
				msgInfo="success";
			}else{
				msgInfo="noUser";
			}
		} catch (Exception e) {
			msgInfo="fail";
			e.printStackTrace();
		} finally {
			try {
				response.getWriter().print(msgInfo);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	@SuppressWarnings("finally")
	@RequestMapping(value = "qryUser.do")
	public ModelAndView qryUser(HttpServletRequest request,
			HttpServletResponse response) {
		ModelMap modelMap = new ModelMap();
		try {
			UserBean qryUser = userManageService.qryUser(request.getParameter("staffId"), null);
			if(null!=qryUser){
				modelMap.put("msgInfo", "success");
				modelMap.put("qryUser", qryUser);
			}else{
				modelMap.put("msgInfo", "noUser");
			}
		} catch (Exception e) {
			e.printStackTrace();
			modelMap.put("msgInfo", "fail");
		} finally {
			return new ModelAndView("web/user/editUser", modelMap);
		}
	} 
	
	@RequestMapping(value = "modifyUser.do")
	public void modifyUser(HttpServletRequest request,
			HttpServletResponse response){
		
		String staffId = request.getParameter("staffId");
		String cityId = request.getParameter("cityId");
		String userName = request.getParameter("userName");
		String userType = request.getParameter("userType");
		String adminFlag = request.getParameter("adminFlag");
		String adminId = request.getParameter("adminId");
		String contactNo = request.getParameter("contactNo");
		String company = request.getParameter("company");
		String remark = request.getParameter("remark");
		String status = request.getParameter("status");
		String msgInfo = "";
		
		UserBean modifyUser = new UserBean();
		modifyUser.setLoginId(staffId);
		modifyUser.setCityId(cityId);
		modifyUser.setUserType(userType);
		modifyUser.setAdminId(adminId);
		modifyUser.setAdminFlag(adminFlag);
		modifyUser.setContactNo(contactNo);
		modifyUser.setCompany(company);
		modifyUser.setRemark(remark);
		modifyUser.setUserName(userName);
		modifyUser.setStatus(status);
		
		try{
			int modifyFlag = userManageService.modifyUser(modifyUser);
			if(1 == modifyFlag){
				msgInfo="success";
			}else{
				msgInfo="noUser";
			}
		}catch (Exception e) {
			msgInfo="fail";
			e.printStackTrace();
		} finally {
			try {
				response.getWriter().print(msgInfo);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value = "createUser.do")
	public void createUser(HttpServletRequest request,
			HttpServletResponse response){
		String staffId = request.getParameter("staffId");
		String cityId = request.getParameter("cityId");
		String userName = request.getParameter("userName");
		String userType = request.getParameter("userType");
		String adminFlag = request.getParameter("adminFlag");
		String adminId = request.getParameter("adminId");
		String contactNo = request.getParameter("contactNo");
		String company = request.getParameter("company");
		String remark = request.getParameter("remark");
		String passWord = request.getParameter("passWord");
		String status = request.getParameter("status");
		String msgInfo = "";
		
		UserBean createUser = new UserBean();
		createUser.setLoginId(staffId);
		createUser.setCityId(cityId);
		createUser.setUserType(userType);
		createUser.setAdminId(adminId);
		createUser.setAdminFlag(adminFlag);
		createUser.setContactNo(contactNo);
		createUser.setCompany(company);
		createUser.setRemark(remark);
		createUser.setUserName(userName);
		createUser.setPassWord(passWord);
		createUser.setStatus(status);
		
		try{
			// 1判断工号是否存在
			UserBean qryUser = userManageService.qryUser(staffId, null);
			if(null!=qryUser){
				msgInfo="userExists";
			}else{
				// 2.1生成序列
				List maxIdList = userManageService.createSeq();
				String maxId = (String) maxIdList.get(0);
				createUser.setId(new CommUtil().addLing((Integer.parseInt(maxId)+1)+"",6));
				// 2.2添加用户
				userManageService.createUser(createUser);
				msgInfo="success";
			}
		}catch (Exception e) {
			msgInfo="fail";
			e.printStackTrace();
		} finally {
			try {
				response.getWriter().print(msgInfo);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
	}
	
	@RequestMapping(value = "modifyUserStatus.do")
	public void deleteUser(HttpServletRequest request,
			HttpServletResponse response){
		String staffId = request.getParameter("staffId");
		String status = request.getParameter("status");
		UserBean modifyUser = new UserBean();
		modifyUser.setLoginId(staffId);
		modifyUser.setStatus(status);
		String msgInfo = "";
		try{
			int modifyFlag = userManageService.modifyUserStatus(modifyUser);
			if(1 == modifyFlag){
				msgInfo="success";
			}else{
				msgInfo="noUser";
			}
		}catch (Exception e) {
			msgInfo="fail";
			e.printStackTrace();
		} finally {
			try {
				response.getWriter().print(msgInfo);
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}
	
	@RequestMapping(value = "/modifyRole.do")
	public ModelAndView modifyRole(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelMap modelMap = new ModelMap();
		String userId = request.getParameter("userId") + "";
		modelMap.addAttribute("existRoleList", userManageService.queryExistRole(userId));
		modelMap.addAttribute("userId", userId);
		modelMap.addAttribute("notExistRoleList", userManageService.queryNotExistRole(userId));
		return new ModelAndView("web/user/userModifyRole", modelMap);
	}
	
	@RequestMapping(value = "/setUserRole.do")
	public ModelAndView setUserRole(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelMap modelMap = new ModelMap();
		String roleIds = request.getParameter("roleIds")==null?"":(request.getParameter("roleIds")+"");
		String userId = request.getParameter("userId")==null?"":(request.getParameter("userId")+"");
		String operator = request.getSession().getAttribute("loginId")==null?"":request.getSession().getAttribute("loginId")+"";//操作员
		int i = userManageService.setUserRole(roleIds, userId, operator);
		modelMap.addAttribute("code", i+"");
		return new ModelAndView("info", modelMap);
	}
}
