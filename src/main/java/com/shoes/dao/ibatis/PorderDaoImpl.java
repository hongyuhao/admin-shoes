package com.shoes.dao.ibatis;

import com.shoes.dao.PorderDao;
import com.shoes.entity.Porder;

import javax.annotation.Resource;

import com.shoes.framework.base.dao.mybatis.BaseDaoMybatis;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Repository;

@Repository("porderDao")
public class PorderDaoImpl extends BaseDaoMybatis<Porder> implements PorderDao {

    public PorderDaoImpl() {
        super();
        setNameSpace( "sqlMapper.Porder" );
    }

    @Required
    @Resource
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory( sqlSessionFactory );
    }
}