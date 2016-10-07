package com.shoes.service.daoimpl;

import com.alibaba.fastjson.JSONObject;
import com.shoes.dao.BrandDao;
import com.shoes.entity.Brand;
import com.shoes.framework.base.dao.BaseDao;
import com.shoes.framework.base.service.daoimpl.BaseServiceImpl;
import com.shoes.service.BrandService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class) 
@Service("brandService")
public class BrandServiceImpl extends BaseServiceImpl<Brand> implements BrandService {
    @Resource
    private BrandDao brandDao;

    public BrandServiceImpl() {
        super();
    }

    public BrandDao getBrandDao() {
        return brandDao;
    }

    /**
     * Don't remove or edit it.
     */
    @Override
    protected BaseDao<Brand> getBaseDao() {
        return brandDao;
    }

    public void setBrandDao(BrandDao brandDao) {
        this.brandDao = brandDao;
    }

    @Override
    public JSONObject uploadImg(HttpServletRequest request) {
        return null;
    }
}