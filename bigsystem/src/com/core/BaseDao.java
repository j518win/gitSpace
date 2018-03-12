package com.core;
/**
 * @author lizj_sd:
 * 
 */
import javax.annotation.PostConstruct;
import javax.annotation.Resource;

import org.springframework.orm.ibatis.SqlMapClientTemplate;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;

import com.ibatis.sqlmap.client.SqlMapClient;

public class BaseDao  extends SqlMapClientDaoSupport {
	public static SqlMapClientTemplate sct = null;
    @Resource(name="sqlMapClient")  //通过bean名称注入
    private SqlMapClient sqlMapClient;
    
    @PostConstruct  //完成sqlMapClient初始化工作
    public void initSqlMapClient(){
           super.setSqlMapClient(sqlMapClient);
           this.sct=super.getSqlMapClientTemplate();
    }
    
}