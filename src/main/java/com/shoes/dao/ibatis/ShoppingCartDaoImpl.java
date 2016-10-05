package com.shoes.dao.ibatis;

import com.shoes.dao.ShoppingCartDao;
import com.shoes.entity.ShoppingCart;

import javax.annotation.Resource;

import com.shoes.framework.base.dao.mybatis.BaseDaoMybatis;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Repository;

@Repository("shoppingCartDao")
public class ShoppingCartDaoImpl extends BaseDaoMybatis<ShoppingCart> implements ShoppingCartDao {

    public ShoppingCartDaoImpl() {
        super();
        setNameSpace( "sqlMapper.ShoppingCart" );
    }

    @Required
    @Resource
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory( sqlSessionFactory );
    }
}