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


@Component// ��Service��ע�뵽bean����
@Transactional// ע���������
public class TestService {
	@Resource(name = "testDao")// ͨ������ע�뵽bean����
	private TestDao testDao;

	public List getAllData() throws Exception {
		return (List)testDao.getAllData();
	}

}
