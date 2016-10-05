package com.shoes.service.daoimpl;

import com.shoes.dao.ProductDao;
import com.shoes.entity.Product;
import com.shoes.framework.base.dao.BaseDao;
import com.shoes.framework.base.service.daoimpl.BaseServiceImpl;
import com.shoes.service.ProductService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class) 
@Service("productService")
public class ProductServiceImpl extends BaseServiceImpl<Product> implements ProductService {
    @Resource
    private ProductDao productDao;

    public ProductServiceImpl() {
        super();
    }

    public ProductDao getProductDao() {
        return productDao;
    }

    /**
     * Don't remove or edit it.
     */
    @Override
    protected BaseDao<Product> getBaseDao() {
        return productDao;
    }

    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }
}