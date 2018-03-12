package com.sm.logcheck.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.core.BaseDao;
import com.sm.logcheck.service.LogCheckService;

/**
 * @author lizj_sd:
 * @version createDate：2016-7-1 下午1:54:39
 * 
 */
@Controller
@RequestMapping(value = "jsp/smm/logCheck")
public class LogCheckController extends BaseDao {
	@Resource(name="logCheckService")
	private LogCheckService logCheckService;
	private static Logger log = Logger.getLogger(LogCheckController.class); 
	
	@RequestMapping(value = "/logCheck.do")
	public ModelAndView myMethod(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelMap modelMap = new ModelMap();
		int curPage=1;
		String ccurPage = request.getParameter("jumpPage")+"";
		String qryNum = request.getParameter("qryNum");
		String czlx = request.getParameter("czlx");
		String jzrq = request.getParameter("jzrq");
		String qsrq = request.getParameter("qsrq");
		String depart = request.getParameter("depart");
		
		String czrid="";
		String czrname="";
		String czr_temp=request.getParameter("czr");
		if(czr_temp.indexOf("~")>-1){
			czrid = czr_temp.split("~")[0];
			czrname = czr_temp.split("~")[1];
		}
		
		Map dmap = new HashMap();
		dmap.put("qryNum", qryNum);
		dmap.put("czlx", czlx);
		dmap.put("qsrq", qsrq);
		dmap.put("jzrq", jzrq);
		dmap.put("czr", czrid);
		dmap.put("depart", depart);
		
		if(!"".equals(ccurPage)){
			curPage=Integer.parseInt(ccurPage);
		}else{
			ccurPage="1";
		}
		List dataList = new ArrayList();
		dataList=logCheckService.getAllData(Integer.parseInt(ccurPage),dmap);
		modelMap.addAttribute("datalist", dataList);
		int allPageNum=0;
			allPageNum=logCheckService.getCountData(dmap);
		int allPage=0;
		if (allPageNum % 10 == 0) { // 根据总行数计算总页数
			allPage = allPageNum / 10;
		} else {
			allPage = allPageNum / 10 + 1;
		}
		
		modelMap.addAttribute("qryNum", qryNum);
		modelMap.addAttribute("czlx", czlx);
		modelMap.addAttribute("qsrq", qsrq);
		modelMap.addAttribute("jzrq", jzrq);
		modelMap.addAttribute("czrid", czrid);
		modelMap.addAttribute("czrname", czrname);
		modelMap.addAttribute("depart", depart);
		modelMap.addAttribute("curPage", curPage);
		modelMap.addAttribute("allPageNum", allPageNum);
		modelMap.addAttribute("allPage", allPage);
		modelMap.addAttribute("perPageNum", "10");
		return new ModelAndView("smm/cxtj/czrz/czrz", modelMap);
	}		
	
	public String getDepart(){
		StringBuffer sb = new StringBuffer();
		List list = new ArrayList();
		Map map = new HashMap();
		list = sct.queryForList("slogcheck.getDepart");
		if(list.size()>0){
			for(int i=0;i<list.size();i++){
				map=(Map)list.get(i);
				sb.append("<option value=\"").append(map.get("COMPANY")).append("\">").append(map.get("COMPANY")).append("</option>");
			}
		}
		return sb.toString();
	}
	
	public String getCzr(){
		StringBuffer sb = new StringBuffer();
		List list = new ArrayList();
		Map map = new HashMap();
		list = sct.queryForList("slogcheck.getCzr");
		if(list.size()>0){
			for(int i=0;i<list.size();i++){
				map=(Map)list.get(i);
				sb.append("<option value=\"").append(map.get("LOGINID")).append("~").append(map.get("USERNAME")).append("\">").append(map.get("USERNAME")).append("</option>");
			}
		}
		return sb.toString();
	}
	
	@RequestMapping(value = "/exportData.do")
	public void exportData(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String qryNum = request.getParameter("qryNum");
		String czlx = request.getParameter("czlx");
		String jzrq = request.getParameter("jzrq");
		String qsrq = request.getParameter("qsrq");
		String depart = request.getParameter("depart");
		
		String czrid="";
		String czrname="";
		String czr_temp=request.getParameter("czr")==null?"":request.getParameter("czr");
		if(czr_temp.indexOf("~")>-1){
			czrid = czr_temp.split("~")[0];
			czrname = czr_temp.split("~")[1];
		}
		
		Map dmap = new HashMap();
		dmap.put("qryNum", qryNum);
		dmap.put("czlx", czlx);
		dmap.put("qsrq", qsrq);
		dmap.put("jzrq", jzrq);
		dmap.put("czr", czrid);
		dmap.put("depart", depart);
		List dataList = new ArrayList();
		dataList=logCheckService.getAllData(dmap);
		export(dataList,response);
	}
	
	private void  export(List list,HttpServletResponse res){
	    WritableWorkbook book = null;
        WritableSheet sheet = null;
        jxl.write.Label label;
        res.reset();

        res.setContentType("application/msexcel,charset=GBK");
        res.setHeader("Content-Disposition", "attachment; filename=rz.xls");     	
       
      
        int pagesize = 65535;
        int size = list.size();
        int nums = size/pagesize;
        int ys = size%pagesize;
        if (ys>0){
       	 nums = nums +1;
        }
        
        Map map = new HashMap();
        int k = pagesize;
        
        try {
			book = Workbook.createWorkbook(res.getOutputStream());
		} catch (IOException e1) {
			e1.printStackTrace();
		}
        
        for (int i=0;i<nums;i++){
       	 if (i==nums-1 && ys>0){
       		 k = ys;
       	 }
               
            sheet = book.createSheet("第"+(i+1)+"页", i);
            
            try {
           	label = new jxl.write.Label(0, 0, "操作账号");
				sheet.addCell(label);
				label = new jxl.write.Label(1, 0, "姓名");
				sheet.addCell(label);
				label = new jxl.write.Label(2, 0, "部门");
				sheet.addCell(label);
				label = new jxl.write.Label(3, 0, "登录IP");
				sheet.addCell(label);
				label = new jxl.write.Label(4, 0, "登录MAC");
				sheet.addCell(label);
				label = new jxl.write.Label(5, 0, "操作号码");
				sheet.addCell(label);
				label = new jxl.write.Label(6, 0, "操作详情");
				sheet.addCell(label);
				label = new jxl.write.Label(7, 0, "操作原因");
				sheet.addCell(label);
				label = new jxl.write.Label(8, 0, "操作时间");
				sheet.addCell(label);
				
			} catch (RowsExceededException e1) {
				e1.printStackTrace();
			} catch (WriteException e1) {
				e1.printStackTrace();
			}
			
       	 for (int j=0,z=1;j<k;j++,z++){
       		 map = (Map)list.get(i*pagesize+j);
       			try {
        			label = new jxl.write.Label(0, z, map.get("LOGIN_ID") + "");
       				sheet.addCell(label);
       				label = new jxl.write.Label(1, z, map.get("USERNAME") + "");
       				sheet.addCell(label);
       				label = new jxl.write.Label(2, z, map.get("COMPANY") + "");
       				sheet.addCell(label);
       				label = new jxl.write.Label(3, z, map.get("LOGIN_IP") + "");
       				sheet.addCell(label);
       				label = new jxl.write.Label(4, z, map.get("LOGIN_MAC") + "");
       				sheet.addCell(label);
       				label = new jxl.write.Label(5, z, map.get("OP_NUM") + "");
       				sheet.addCell(label);
       				label = new jxl.write.Label(6, z, map.get("OP_FUNC") + "");
       				sheet.addCell(label);
       				label = new jxl.write.Label(7, z, map.get("OP_NOTE") + "");
       				sheet.addCell(label);
       				label = new jxl.write.Label(8, z, map.get("OP_DATE") + "");
       				sheet.addCell(label);
       			} catch (RowsExceededException e) {
       				// TODO Auto-generated catch block
       				e.printStackTrace();
       			} catch (WriteException e) {
       				// TODO Auto-generated catch block
       				e.printStackTrace();
       			}
        	}
       	 
        }
        
        try {
       	 if(size==0){
     		   sheet = book.createSheet("未查询到数据", 0);
       	 }
            book.write();
        } catch (IOException e) {
            e.printStackTrace();
        }
        try {
            book.close();
        } catch (WriteException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        
	}
	
}
