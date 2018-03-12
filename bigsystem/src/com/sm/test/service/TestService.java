package com.sm.test.service;
/**
 * @author lizj_sd:
 * 
 */
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.sm.test.dao.TestDao;


@Component// 将Service类注入到bean里面
@Transactional// 注入事务管理
public class TestService {
	@Resource(name = "testDao")// 通过名称注入到bean里面
	private TestDao testDao;

	public List getAllData() throws Exception {
		return (List)testDao.getAllData();
	}

}
