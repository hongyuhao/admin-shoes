package com.shoes.service;

import com.alibaba.fastjson.JSONObject;
import com.shoes.entity.User;
import com.shoes.framework.base.service.daoimpl.BaseService;

public interface UserService extends BaseService<User> {
    JSONObject login(String username, String password);
}