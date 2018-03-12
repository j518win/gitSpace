package com.sm.role.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.common.CommUtil;
import com.core.BaseDao;
import com.sm.user.bean.UserBean;

/**
 * @author lizj_sd:
 * @version createDate：2016-7-1 下午1:54:39
 * 
 */
@Controller
@RequestMapping(value = "jsp/sm/role")
public class RoleController extends BaseDao {
	
	@RequestMapping(value = "/roleQuery.do")
	public ModelAndView myMethod(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelMap modelMap = new ModelMap();
		List dataList = new ArrayList();
		dataList=sct.queryForList("srole.roleQuery");
		
		modelMap.addAttribute("datalist", dataList);
		return new ModelAndView("web/role/roleQuery", modelMap);
	}		
	
	@RequestMapping(value = "createRole.do")
	public void createRole(HttpServletRequest request,
			HttpServletResponse response){
		String roleName = request.getParameter("roleName");
		String roleDesc = request.getParameter("roleDesc");
		String operator = request.getSession().getAttribute("loginId")==null?"":request.getSession().getAttribute("loginId")+"";//操作员
		String msgInfo = "";
		
		Map map = new HashMap();
		map.put("roleName", roleName);
		map.put("roleDesc", roleDesc);
		map.put("operator", operator);
		
		try{
			List maxIdList = sct.queryForList("srole.getMaxRole");
			String maxId = (String) maxIdList.get(0);
			map.put("maxId", new CommUtil().addLing((Integer.parseInt(maxId)+1)+"",6));
			sct.insert("srole.addRole",map);
			msgInfo="success";
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
	
	
	@RequestMapping(value = "/modifyMenu.do")
	public ModelAndView modifyMenu(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelMap modelMap = new ModelMap();
		
		String roleId = request.getParameter("roleId")+"";
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("d = new dTree('d');");
		sb.append("d.config.useCheckbox = true;");
		sb.append("d.icon.root='"+request.getContextPath()+"/jsp/web/images/menu/webmeeting.gif';");
		sb.append("d.icon.folder='"+request.getContextPath()+"/jsp/web/images/menu/folder.gif';");
		sb.append("d.icon.folderOpen='"+request.getContextPath()+"/jsp/web/images/menu/folderopen.gif';");
		sb.append("d.icon.node='"+request.getContextPath()+"/jsp/web/images/menu/page.gif';");
		sb.append("d.icon.empty='"+request.getContextPath()+"/jsp/web/images/menu/empty.gif';");
		sb.append("d.icon.line='"+request.getContextPath()+"/jsp/web/images/menu/line.gif';");
		sb.append("d.icon.join='"+request.getContextPath()+"/jsp/web/images/menu/join.gif';");
		sb.append("d.icon.joinBottom='"+request.getContextPath()+"/jsp/web/images/menu/joinbottom.gif';");
		sb.append("d.icon.plus='"+request.getContextPath()+"/jsp/web/images/menu/plus.gif';");
		sb.append("d.icon.plusBottom='"+request.getContextPath()+"/jsp/web/images/menu/plusbottom.gif';");
		sb.append("d.icon.minus='"+request.getContextPath()+"/jsp/web/images/menu/minus.gif';");
		sb.append("d.icon.minusBottom='"+request.getContextPath()+"/jsp/web/images/menu/minusbottom.gif';");
		sb.append("d.icon.nlPlus='"+request.getContextPath()+"/jsp/web/images/menu/nolines_plus.gif';");
		sb.append("d.icon.nlMinus='"+request.getContextPath()+"/jsp/web/images/menu/nolines_minus.gif';");
		List list = sct.queryForList("srole.queryAllMenu");
		List menuInUseList = sct.queryForList("srole.queryRoleMenu",roleId);
		Map menuInUseMap = new HashMap();
		for (int i=0;i<menuInUseList.size();i++){
			Map map = (Map)menuInUseList.get(i);
			menuInUseMap.put(map.get("MENUID"), true);
		}
		
		for (int i=0;i<list.size();i++){
			Map map = (Map)list.get(i);
			sb.append("d.add(");
			sb.append("'"+(String) map.get("ID") + "',");
			if (map.get("PARENTID")==null || "".equals(map.get("PARENTID")+"")){
				sb.append("'-1',");
			}else{
			    sb.append("'"+(String) map.get("PARENTID") + "',");
			}
			sb.append("'"+map.get("MENUNAME")+"',");
			sb.append("'','',");
			sb.append("'"+map.get("NM")+"'");
			sb.append(");");
			if (menuInUseMap.get(map.get("ID"))!=null){
				sb.append("d.aNodes["+i+"]._check=true;");
			}
		}
		sb.append("document.write(d); d.openAll();");
		sb.append("</script>");
		
		modelMap.addAttribute("menuTree", sb.toString());
		modelMap.addAttribute("roleId", roleId);
		return new ModelAndView("web/role/roleModifyMenu", modelMap);
	}
	
	@RequestMapping(value = "/setRoleMenu.do")
	public ModelAndView setRoleMenu(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelMap modelMap = new ModelMap();
		String roleId = request.getParameter("roleId")+"";
		String menuIds = request.getParameter("menusId")+"";
		String operator = request.getSession().getAttribute("loginId")==null?"":request.getSession().getAttribute("loginId")+"";//操作员
		int ret = this.setRoleMenu(menuIds, roleId, operator);
		modelMap.addAttribute("code", ret+"");
		return new ModelAndView("info", modelMap);
	}
	
	public int setRoleMenu(String menuIds,String roleId,String operator){
		if ("".equals(menuIds)||menuIds==null){
			sct.delete("srole.deleteRoleMenu", roleId);
			return 1;
		}
		sct.delete("srole.deleteRoleMenu", roleId);
		String menuId[] = menuIds.split(",");
		int len = menuId.length;
		List maxIdList = sct.queryForList("srole.getMaxRoleMenu");
		String maxId = (String) maxIdList.get(0);
		Map map;
		for(int i=1;i<=len;i++){
			map=new HashMap();
			map.put("id", new CommUtil().addLing((Integer.parseInt(maxId)+i)+"",6));
			map.put("menuId", menuId[i-1]);
			map.put("roleId", roleId);
			map.put("operator", operator);
			sct.insert("srole.addRoleMenu", map);
		}
		return 1;
	}
	
}
