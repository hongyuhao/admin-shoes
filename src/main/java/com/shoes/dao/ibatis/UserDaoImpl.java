package com.shoes.dao.ibatis;

import com.shoes.dao.UserDao;
import com.shoes.entity.User;

import javax.annotation.Resource;

import com.shoes.framework.base.dao.mybatis.BaseDaoMybatis;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Repository;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoMybatis<User> implements UserDao {

    public UserDaoImpl() {
        super();
        setNameSpace( "sqlMapper.User" );
    }

    @Required
    @Resource
    public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
        super.setSqlSessionFactory( sqlSessionFactory );
    }
}