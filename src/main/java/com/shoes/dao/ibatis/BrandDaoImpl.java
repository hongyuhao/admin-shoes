package com.shoes.dao.ibatis;

import com.shoes.dao.BrandDao;
import com.shoes.entity.Brand;

import javax.annotation.Resource;

import com.shoes.framework.base.dao.mybatis.BaseDaoMybatis;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Repository;

@Repository("brandDao")
public class BrandDaoImpl extends BaseDaoMybatis<Brand> implements BrandDao {

    public BrandDaoImpl() {
        super();
        setNameSpace( "sqlMapper.Brand" );
    }

    @Required
    @Resource
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory( sqlSessionFactory );
    }
}