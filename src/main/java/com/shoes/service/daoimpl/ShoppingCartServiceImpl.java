package com.shoes.service.daoimpl;

import com.shoes.dao.ShoppingCartDao;
import com.shoes.entity.ShoppingCart;
import com.shoes.framework.base.dao.BaseDao;
import com.shoes.framework.base.service.daoimpl.BaseServiceImpl;
import com.shoes.service.ShoppingCartService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class) 
@Service("shoppingCartService")
public class ShoppingCartServiceImpl extends BaseServiceImpl<ShoppingCart> implements ShoppingCartService {
    @Resource
    private ShoppingCartDao shoppingCartDao;

    public ShoppingCartServiceImpl() {
        super();
    }

    public ShoppingCartDao getShoppingCartDao() {
        return shoppingCartDao;
    }

    /**
     * Don't remove or edit it.
     */
    @Override
    protected BaseDao<ShoppingCart> getBaseDao() {
        return shoppingCartDao;
    }

    public void setShoppingCartDao(ShoppingCartDao shoppingCartDao) {
        this.shoppingCartDao = shoppingCartDao;
    }
}