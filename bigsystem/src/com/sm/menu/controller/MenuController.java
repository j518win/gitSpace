package com.sm.menu.controller;

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

/**
 * @author lizj_sd:
 * @version createDate£º2016-7-1 ÏÂÎç1:54:39
 * 
 */
@Controller
@RequestMapping(value = "jsp/sm/menu")
public class MenuController extends BaseDao {
	
	@RequestMapping(value = "/menuQuery.do")
	public ModelAndView myMethod(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelMap modelMap = new ModelMap();
		List dataList = new ArrayList();
		dataList=sct.queryForList("smenu.menuQuery");
		
		modelMap.addAttribute("datalist", dataList);
		return new ModelAndView("web/menu/menuQuery", modelMap);
	}		
	
	@RequestMapping(value = "/getMenuTree.do")
	public ModelAndView getMenuTree(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("menuTree", orgMenuTree(request));
		return new ModelAndView("web/menu/menuTree", modelMap);
	}
	
	@RequestMapping(value = "/menuTreeDisplay.do")
	public ModelAndView menuTreeDisplay(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("menuTree", orgMenuTree(request));
		return new ModelAndView("web/menu/menuTreeDisplay", modelMap);
	}
	
	public String orgMenuTree(HttpServletRequest request){
		StringBuffer sb = new StringBuffer();
		sb.append("<script>");
		sb.append("d = new dTree('d');");
		sb.append("d.config.useRadio = true;");
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

		List list = new ArrayList();
		list=sct.queryForList("smenu.getMenuTree");
		
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
		}
		sb.append("document.write(d); d.openAll();");
		sb.append("</script>");
		return sb.toString();
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/addMenu.do")
	public ModelAndView addMenu(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelMap modelMap = new ModelMap();
		String menuName = request.getParameter("menuname")==null?"": request.getParameter("menuname")+"";
		String menuDesc = request.getParameter("menudesc")==null?"": request.getParameter("menudesc")+"";
		String url = request.getParameter("url")==null?"": request.getParameter("url")+"";
		String parentId = request.getParameter("parentid")==null?"": request.getParameter("parentid")+"";
		String operator = request.getSession().getAttribute("loginId")==null?"":request.getSession().getAttribute("loginId")+"";//²Ù×÷Ô±
		List maxIdList = sct.queryForList("smenu.getMaxMenuId");
		String maxId = (String) maxIdList.get(0);
		Map map = new HashMap();
		map.put("maxId", new CommUtil().addLing((Integer.parseInt(maxId)+1)+"",6));
		map.put("menuName", menuName);
		map.put("menuDesc", menuDesc);
		map.put("url", url==null||"".equals(url)?"0":url);
		map.put("parentId", parentId);
		map.put("operator", operator);
		map.put("menuType", url==null||"".equals(url)?"0":"1");
		int ret = 0;
		ret=addMenu(map);
		modelMap.addAttribute("code", ret+"");
		return new ModelAndView("info", modelMap);
	}	
	
	public int addMenu(Map map){
		sct.insert("smenu.addMenu",map);
		return 1;
	}
	
}
