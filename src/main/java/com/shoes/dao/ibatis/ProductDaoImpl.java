package com.shoes.dao.ibatis;

import com.shoes.dao.ProductDao;
import com.shoes.entity.Product;

import javax.annotation.Resource;

import com.shoes.framework.base.dao.mybatis.BaseDaoMybatis;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Repository;

@Repository("productDao")
public class ProductDaoImpl extends BaseDaoMybatis<Product> implements ProductDao {

    public ProductDaoImpl() {
        super();
        setNameSpace( "sqlMapper.Product" );
    }

    @Required
    @Resource
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory( sqlSessionFactory );
    }
}