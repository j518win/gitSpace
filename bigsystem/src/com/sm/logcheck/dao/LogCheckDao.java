package com.sm.logcheck.dao;
/**
 * @author lizj_sd:
 * 
 */
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import com.core.BaseDao;

@Component
public class LogCheckDao extends BaseDao {
	

	@SuppressWarnings("unchecked")
	public List getAllData(int ccurPage,Map dmap) throws Exception {
		return getSqlMapClientTemplate().queryForList("slogcheck.queryLog",dmap,(ccurPage-1)*10,10);
	}
	
	@SuppressWarnings("unchecked")
	public int getCountData(Map dmap) throws Exception {
		List list = getSqlMapClientTemplate().queryForList("slogcheck.queryLogCount",dmap);
		return  (Integer)(list.get(0));
	}
	
	@SuppressWarnings("unchecked")
	public List getAllData(Map dmap) throws Exception {
		return getSqlMapClientTemplate().queryForList("slogcheck.queryLog",dmap);
	}
}
