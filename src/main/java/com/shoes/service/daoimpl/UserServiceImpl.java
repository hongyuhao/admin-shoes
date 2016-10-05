package com.shoes.service.daoimpl;

import com.shoes.dao.UserDao;
import com.shoes.entity.User;
import com.shoes.framework.base.dao.BaseDao;
import com.shoes.framework.base.service.daoimpl.BaseServiceImpl;
import com.shoes.service.UserService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class) 
@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
    @Resource
    private UserDao userDao;

    public UserServiceImpl() {
        super();
    }

    public UserDao getUserDao() {
        return userDao;
    }

    /**
     * Don't remove or edit it.
     */
    @Override
    protected BaseDao<User> getBaseDao() {
        return userDao;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}