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


@Component// 将Service类注入到bean里面
@Transactional// 注入事务管理
public class LogCheckService {
	@Resource(name = "logCheckDao")// 通过名称注入到bean里面
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
