package com.sm.test.dao;
/**
 * @author lizj_sd:
 * 
 */
import java.util.List;

import org.springframework.stereotype.Component;
import com.core.BaseDao;

@Component
public class TestDao extends BaseDao {
	

	@SuppressWarnings("unchecked")
	public List getAllData() throws Exception {
		return getSqlMapClientTemplate().queryForList("stest.findAllData");
	}
}
