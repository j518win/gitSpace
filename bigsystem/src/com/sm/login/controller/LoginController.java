package com.sm.login.controller;

import java.util.List;
import java.util.Map;

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
import com.sm.writelog.WriteLog;

/**
 * @author lizj_sd:
 * @version createDate：2016-7-1 下午1:54:39
 * 
 */
@Controller
@RequestMapping(value = "jsp/")
public class LoginController {
	
	@Resource(name="userManageService")
	private UserManageService userManageService;
	
	@RequestMapping(value = "login/login.do")
	public ModelAndView myMethod(HttpServletRequest request,
			HttpServletResponse response,ModelMap mm) throws Exception {
		ModelMap modelMap = new ModelMap();
		
		String loginId=request.getParameter("loginId")+"";
		String passWord=request.getParameter("passWord")+"";
		
		CommUtil cu = new CommUtil();
		String ipAddr = cu.getIpAddr(request);
		request.getSession().setAttribute("ipAddr", ipAddr);
		//String macAddr = cu.getMacAddr(request);
//		String macAddr = "00-00-00-00-00-00";//应网管张琛要求，去掉mac
//		request.getSession().setAttribute("macAddr", macAddr);
//		
		UserBean loginUser = userManageService.qryUser(loginId, passWord);
		
		if(null!=loginUser && "0".equals(loginUser.getStatus())){
			request.getSession().setAttribute("menuList", orgUserMenuInfo(loginUser.getId()));
			request.getSession().setAttribute("menuListALL", userManageService.getUserMenu(loginUser.getId()));
			request.getSession().setAttribute("loginId", loginId);
			request.getSession().setAttribute("cityId", loginUser.getCityId());
			request.getSession().setAttribute("company", loginUser.getCompany());
			request.getSession().setAttribute("curUser", loginUser);
			
			Thread t1 = new Thread(new WriteLog(request,"",loginId+"登录成功",""));
			t1.start();
			mm.addAttribute("Menu", userManageService.getUserMenu(loginUser.getId()));
			mm.addAttribute("aaaaaa", "test ok");
			return new ModelAndView("web/main", modelMap);
			
		}else{
			Thread t1 = new Thread(new WriteLog(request,"",loginId+"登录失败",""));
			t1.start();
			
			modelMap.addAttribute("mess", "feil");
			return new ModelAndView("login/login", modelMap);
		}
	}
	
	/**
	 * 组织用户菜单信息
	 * @param userid
	 * @return
	 */
	private String orgUserMenuInfo(String userid){
		List menuList = userManageService.getUserMenu(userid);
		return orgMenuTree(menuList);
	}
	
	/**
	 * 组织easyUI的菜单
	 * @param menuList
	 * @return
	 */
	private String orgEasyUIMenu(List menuList){
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < menuList.size(); i++) {
			Map map = (Map) menuList.get(i);
//			 <div title="标题1" data-options="iconCls:'icon-folder',selected:true" style="overflow:auto;padding:10px;">
//             <span onclick="openTab('','')">菜单名称</span>
//             </div>
		}
		
		return null;
	}
	/**
	 * 根据菜单list，生成dtree
	 * @param menuList
	 * @return
	 */
	private String orgMenuTree(List menuList){
		StringBuffer sb = new StringBuffer();
		sb.append("<script LANGUAGE=\"JavaScript\">");
		sb.append("d = new dTree('d');");
		for (int i = 0; i < menuList.size(); i++) {
			Map map = (Map) menuList.get(i);				
			sb.append("d.add('");
			sb.append((String) map.get("ID") + "',");
			if (map.get("PARENTID")==null || "".equals(map.get("PARENTID")+""))
				sb.append("'-1',");
			else
			    sb.append("'"+(String) map.get("PARENTID") + "',");
			if ("0".equals((String) map.get("ID"))) {
				sb.append("''");
			} else {
				sb.append("'" + (String) map.get("NAME") + "'");
			}
			if ((String) map.get("CODE") != null
					&& !"0".equals((String) map.get("CODE"))) {
				sb.append(",'"+ (String) map.get("CODE") + "'");
				sb.append(",''");
				sb.append(",''");
			}
			sb.append(");");
		}
		sb.append("document.write(d);d.openAll();");
		sb.append("</script>");
		return sb.toString();
	}
	
}
