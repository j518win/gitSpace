package com.sm.logcheck.service;
/**
 * @author lizj_sd:
 * 
 */
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.sm.logcheck.dao.LogCheckDao;


@Component// ��Service��ע�뵽bean����
@Transactional// ע���������
public class LogCheckService {
	@Resource(name = "logCheckDao")// ͨ������ע�뵽bean����
	private LogCheckDao logCheckDao;

	public List getAllData(int ccurPage,Map dmap) throws Exception {
		return (List)logCheckDao.getAllData(ccurPage,dmap);
	}

	public int getCountData(Map dmap) throws Exception {
		return logCheckDao.getCountData(dmap);
	}
	
	public List getAllData(Map dmap) throws Exception {
		return (List)logCheckDao.getAllData(dmap);
	}
}
