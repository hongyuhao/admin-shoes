package com.shoes.dao.ibatis;

import com.shoes.dao.ProductSizeDao;
import com.shoes.entity.ProductSize;

import javax.annotation.Resource;

import com.shoes.framework.base.dao.mybatis.BaseDaoMybatis;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Repository;

@Repository("productSizeDao")
public class ProductSizeDaoImpl extends BaseDaoMybatis<ProductSize> implements ProductSizeDao {

    public ProductSizeDaoImpl() {
        super();
        setNameSpace( "sqlMapper.ProductSize" );
    }

    @Required
    @Resource
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory( sqlSessionFactory );
    }
}