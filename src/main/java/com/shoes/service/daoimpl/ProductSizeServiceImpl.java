package com.shoes.service.daoimpl;

import com.shoes.dao.ProductSizeDao;
import com.shoes.entity.ProductSize;
import com.shoes.framework.base.dao.BaseDao;
import com.shoes.framework.base.service.daoimpl.BaseServiceImpl;
import com.shoes.service.ProductSizeService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class) 
@Service("productSizeService")
public class ProductSizeServiceImpl extends BaseServiceImpl<ProductSize> implements ProductSizeService {
    @Resource
    private ProductSizeDao productSizeDao;

    public ProductSizeServiceImpl() {
        super();
    }

    public ProductSizeDao getProductSizeDao() {
        return productSizeDao;
    }

    /**
     * Don't remove or edit it.
     */
    @Override
    protected BaseDao<ProductSize> getBaseDao() {
        return productSizeDao;
    }

    public void setProductSizeDao(ProductSizeDao productSizeDao) {
        this.productSizeDao = productSizeDao;
    }
}