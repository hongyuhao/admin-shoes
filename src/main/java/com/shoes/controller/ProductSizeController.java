package com.shoes.controller;

import com.shoes.entity.ProductSize;
import com.shoes.framework.web.BaseController3;
import com.shoes.framework.web.HttpRequestInfo;
import com.shoes.service.ProductSizeService;

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
@RequestMapping("/admin/productSize")
public class ProductSizeController extends BaseController3 {
    private static final String ROOT_VIEW = "admin/productSize";

    private static final String HOME_VIEW = "admin/productSize/home";

    private static final String EDIT_VIEW = "admin/productSize/edit";

    @Resource
    private ProductSizeService productSizeService;

    @RequestMapping()
    public String listProductSize(HttpServletRequest request, ModelMap model) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        setRequestModelMap( request, model, true );
        getPageList( model );
        return HOME_VIEW;
    }

    @RequestMapping(EDIT)
    public String editProductSize(HttpServletRequest request, ModelMap model) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        setRequestModelMap( request, model, false );
        Integer psId = reqInfo.getIntParameter( "psId", -1 );
        if( psId > 0 ){
            model.put( "model",productSizeService.getById( psId ) ); 
        }
        return EDIT_VIEW;
    }

    @RequestMapping(ADD)
    public String addProductSize(HttpServletRequest request, HttpServletResponse response, ModelMap model, ProductSize productSize) {
        setRequestModelMap(request, model, false);
        DWZResponse.Builder builder;
        try {
            productSizeService.insert( productSize ); 
            builder = DWZResponse.getSucessBuilder("success");
        } catch (Exception e) {
            builder = DWZResponse.getFailBuilder("fail" + Arrays.deepToString(e.getStackTrace()));
        }
        RenderUtil.renderHtml(builder.build().toString(), response);
        return null;
    }

    @RequestMapping(DETAIL)
    public String detailProductSize(HttpServletRequest request, ModelMap model) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        Integer psId = reqInfo.getIntParameter( "psId", -1 );
        if( psId > 0 ){
            model.addAttribute( productSizeService.getById( psId ) ); 
        }
        setRequestModelMap(request, model);
        return null;
    }

    @RequestMapping(UPDATE)
    public String updateProductSize(HttpServletRequest request, HttpServletResponse response, ModelMap model, ProductSize productSizeNew) throws Exception {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        Integer psId = reqInfo.getIntParameter( "psId", -1 );
        if( psId > 0 ){
            DWZResponse.Builder builder;
            try {
                ProductSize productSize = productSizeService.getById( psId ); 
                super.copyProperties(productSize, productSizeNew);
                productSizeService.update( productSize ); 
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
    public String deleteProductSize(HttpServletRequest request, HttpServletResponse response, ModelMap model, String inIdList) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        setRequestModelMap(request, model);
        DWZResponse.Builder builder;
        try {
            String[] idArray = inIdList.split(",");
            model.put("inIdList", idArray);
            productSizeService.delete( model ); 
            builder = DWZResponse.getSucessBuilder("success");
        } catch (Exception e) {
            builder = DWZResponse.getFailBuilder("fail" + Arrays.deepToString(e.getStackTrace()));
        }
        RenderUtil.renderHtml(builder.build().toString(), response);
        model.clear();
        return null;
    }

    private PageList<ProductSize> getPageList(ModelMap model) {
        PageList<ProductSize> productSizeList = productSizeService.getList( model, Integer.parseInt(model.get("pageNum").toString()), Integer.parseInt(model.get("numPerPage").toString()) ); 
        model.put("productSizeList",productSizeList);
        model.put("pageTurn",productSizeList.getPageTurn());
        return productSizeList;
    }
}