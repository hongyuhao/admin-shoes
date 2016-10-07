package com.shoes.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.shoes.entity.Brand;
import com.shoes.framework.web.BaseController3;
import com.shoes.framework.web.HttpRequestInfo;
import com.shoes.service.BrandService;

import java.util.Arrays;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shoes.util.DWZResponse;
import com.shoes.util.PageList;
import com.shoes.util.RenderUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/brand")
public class BrandController extends BaseController3 {
    private static final String ROOT_VIEW = "admin/brand";

    private static final String HOME_VIEW = "admin/brand/home";

    private static final String EDIT_VIEW = "admin/brand/edit";

    /** 图片上传  **/
    private final static  String IMG_UPLOAD = "/imgUpload";

    @Resource
    private BrandService brandService;

    @RequestMapping()
    public String listBrand(HttpServletRequest request, ModelMap model) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        setRequestModelMap( request, model, true );
        if(model.containsKey("lkBrandName")) {
            model.put("likeBrandName", "%" + reqInfo.getParameter("lkBrandName") + "%");
        }
        getPageList( model );
        return HOME_VIEW;
    }

    @RequestMapping(EDIT)
    public String editBrand(HttpServletRequest request, ModelMap model) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        setRequestModelMap( request, model, false );
        Integer brandId = reqInfo.getIntParameter( "brandId", -1 );
        if( brandId > 0 ){
            model.put( "model",brandService.getById( brandId ) ); 
        }
        return EDIT_VIEW;
    }

    @RequestMapping(ADD)
    public String addBrand(HttpServletRequest request, HttpServletResponse response, ModelMap model, Brand brand) {
        setRequestModelMap(request, model, false);
        DWZResponse.Builder builder;
        try {
            brandService.insert( brand ); 
            builder = DWZResponse.getSucessBuilder("success");
        } catch (Exception e) {
            builder = DWZResponse.getFailBuilder("fail" + Arrays.deepToString(e.getStackTrace()));
        }
        RenderUtil.renderHtml(builder.build().toString(), response);
        return null;
    }

    @RequestMapping(DETAIL)
    public String detailBrand(HttpServletRequest request, ModelMap model) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        Integer brandId = reqInfo.getIntParameter( "brandId", -1 );
        if( brandId > 0 ){
            model.addAttribute( brandService.getById( brandId ) ); 
        }
        setRequestModelMap(request, model);
        return null;
    }

    @RequestMapping(UPDATE)
    public String updateBrand(HttpServletRequest request, HttpServletResponse response, ModelMap model, Brand brandNew) throws Exception {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        Integer brandId = reqInfo.getIntParameter( "brandId", -1 );
        if( brandId > 0 ){
            DWZResponse.Builder builder;
            try {
                Brand brand = brandService.getById( brandId ); 
                super.copyProperties(brand, brandNew);
                brandService.update( brand ); 
                model.clear();
                builder = DWZResponse.getSucessBuilder("success");
            } catch (Exception e) {
                builder = DWZResponse.getFailBuilder("fail" + Arrays.deepToString(e.getStackTrace()));
            }
            RenderUtil.renderHtml(builder.build().toString(), response);
        }
        return null;
    }

    @RequestMapping(DELETE)
    public String deleteBrand(HttpServletRequest request, HttpServletResponse response, ModelMap model, String inIdList) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        setRequestModelMap(request, model);
        DWZResponse.Builder builder;
        try {
            String[] idArray = inIdList.split(",");
            model.put("inBrandIdList", idArray);
            brandService.delete( model ); 
            builder = DWZResponse.getSucessBuilder("success");
        } catch (Exception e) {
            builder = DWZResponse.getFailBuilder("fail" + Arrays.deepToString(e.getStackTrace()));
        }
        RenderUtil.renderHtml(builder.build().toString(), response);
        model.clear();
        return null;
    }

    @RequestMapping(IMG_UPLOAD)
    public JSONObject imgUpload(HttpServletRequest request) {
        JSONObject result ;
        try {
            result = brandService.uploadImg(request);
        } catch (Exception e) {
            result = JSONObject.parseObject("{\"code\":1, \"tip\":\"上传失败\"}");
        }
        return result;
    }

    private PageList<Brand> getPageList(ModelMap model) {
        PageList<Brand> brandList = brandService.getList( model, Integer.parseInt(model.get("pageNum").toString()), Integer.parseInt(model.get("numPerPage").toString()) ); 
        model.put("brandList",brandList);
        model.put("pageTurn",brandList.getPageTurn());
        return brandList;
    }
}