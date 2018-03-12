package com.sm.writelog;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.core.BaseDao;

/**
 * @author lizj_sd:
 * @version createDate£º2016-7-19 ÉÏÎç9:24:33
 * 
 */
public class WriteLog extends BaseDao  implements Runnable {
	Map map = new HashMap();
	
	public WriteLog(HttpServletRequest request,String num,String func,String makeNote){
		this.map.put("loginId", (request.getSession().getAttribute("loginId"))==null?"":request.getSession().getAttribute("loginId")+"");
		this.map.put("ipAddr", request.getSession().getAttribute("ipAddr")+"");
		this.map.put("macAddr", request.getSession().getAttribute("macAddr")+"");
		this.map.put("num", num);
		this.map.put("func", func);
		this.map.put("makeNote", makeNote);
	}
	
	public void run() {
		BaseDao.sct.insert("swlog.writelog", map);
	}
}
