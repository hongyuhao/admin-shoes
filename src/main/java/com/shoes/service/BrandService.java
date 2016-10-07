package com.shoes.service;

import com.alibaba.fastjson.JSONObject;
import com.shoes.entity.Brand;
import com.shoes.framework.base.service.daoimpl.BaseService;

import javax.servlet.http.HttpServletRequest;

public interface BrandService extends BaseService<Brand> {

    JSONObject uploadImg(HttpServletRequest request);
}