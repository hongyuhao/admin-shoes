package com.shoes.service.daoimpl;

import com.alibaba.fastjson.JSONObject;
import com.shoes.dao.UserDao;
import com.shoes.entity.User;
import com.shoes.framework.base.dao.BaseDao;
import com.shoes.framework.base.service.daoimpl.BaseServiceImpl;
import com.shoes.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @Override
    public JSONObject login(String username, String password) {
        JSONObject result = new JSONObject();
        try {
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("eqUsername", username);
            List<User> users = userDao.selectByMap(params, false);
            if (users.size() == 0) {
                throw new Exception("用户不存在");
            }

            User user = users.get(0);
            if (!user.getPassword().equals(password)) {
                throw new Exception("用户密码错误");
            }
            if (user.getUsertype() != 0 && user.getUsertype() != 1) {
                throw new Exception("无权限登陆，请联系管理员");
            }
            result.put("tip", "登陆成功");
            result.put("code", 1);
        }catch (Exception e) {
            result.put("tip", e.getMessage());
            result.put("code", 0);
        }
        return result;
    }
}