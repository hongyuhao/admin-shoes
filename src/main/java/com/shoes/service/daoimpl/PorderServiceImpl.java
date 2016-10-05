package com.shoes.service.daoimpl;

import com.shoes.dao.PorderDao;
import com.shoes.entity.Porder;
import com.shoes.framework.base.dao.BaseDao;
import com.shoes.framework.base.service.daoimpl.BaseServiceImpl;
import com.shoes.service.PorderService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class) 
@Service("porderService")
public class PorderServiceImpl extends BaseServiceImpl<Porder> implements PorderService {
    @Resource
    private PorderDao porderDao;

    public PorderServiceImpl() {
        super();
    }

    public PorderDao getPorderDao() {
        return porderDao;
    }

    /**
     * Don't remove or edit it.
     */
    @Override
    protected BaseDao<Porder> getBaseDao() {
        return porderDao;
    }

    public void setPorderDao(PorderDao porderDao) {
        this.porderDao = porderDao;
    }
}