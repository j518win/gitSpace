package com.sm.gxcx;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.core.BaseDao;

/**
 * @author lizj_sd:
 * @version createDate：2016-7-25 上午9:53:54
 * 
 */
public class GxcxData  extends BaseDao{
	public String reData(){
		StringBuffer sb = new StringBuffer();
		sb.append("<graph caption=\"个性查询\" xAxisName=\"类别\" yAxisName=\"次数\" decimalPrecision=\"0\" formatNumberScale=\"0\">");
		String colorArry[]={"AFD8F8","F6BD0F","8BBA00","FF8E46","008E8E","D64646","8E468E","588526","B3AA00","008ED6","9D080D","A186BE"};
		List list = new ArrayList();
		Map map = new HashMap();
		list = sct.queryForList("slogcheck.queryLogReport");
		Random rand = new Random();
		if(list.size()>0){
			for(int i=0;i<list.size();i++){
				map=(Map)list.get(i);
				sb.append("<set name=\"").append(map.get("OP_FUNC")).append("\" value=\"").append(map.get("NUM")).append("\" color=\"").append(colorArry[rand.nextInt(12)]).append("\"/>");
			}
		}
		sb.append("</graph>");
		return sb.toString();
	}
}
