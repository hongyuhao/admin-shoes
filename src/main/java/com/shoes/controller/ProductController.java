package com.shoes.controller;

import com.shoes.entity.Product;
import com.shoes.framework.web.BaseController3;
import com.shoes.framework.web.HttpRequestInfo;
import com.shoes.service.ProductService;

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
@RequestMapping("/admin/product")
public class ProductController extends BaseController3 {
    private static final String ROOT_VIEW = "admin/product";

    private static final String HOME_VIEW = "admin/product/home";

    private static final String EDIT_VIEW = "admin/product/edit";

    @Resource
    private ProductService productService;

    @RequestMapping()
    public String listProduct(HttpServletRequest request, ModelMap model) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        setRequestModelMap( request, model, true );
        getPageList( model );
        return HOME_VIEW;
    }

    @RequestMapping(EDIT)
    public String editProduct(HttpServletRequest request, ModelMap model) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        setRequestModelMap( request, model, false );
        Integer id = reqInfo.getIntParameter( "id", -1 );
        if( id > 0 ){
            model.put( "model",productService.getById( id ) ); 
        }
        return EDIT_VIEW;
    }

    @RequestMapping(ADD)
    public String addProduct(HttpServletRequest request, HttpServletResponse response, ModelMap model, Product product) {
        setRequestModelMap(request, model, false);
        DWZResponse.Builder builder;
        try {
            productService.insert( product ); 
            builder = DWZResponse.getSucessBuilder("success");
        } catch (Exception e) {
            builder = DWZResponse.getFailBuilder("fail" + Arrays.deepToString(e.getStackTrace()));
        }
        RenderUtil.renderHtml(builder.build().toString(), response);
        return null;
    }

    @RequestMapping(DETAIL)
    public String detailProduct(HttpServletRequest request, ModelMap model) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        Integer id = reqInfo.getIntParameter( "id", -1 );
        if( id > 0 ){
            model.addAttribute( productService.getById( id ) ); 
        }
        setRequestModelMap(request, model);
        return null;
    }

    @RequestMapping(UPDATE)
    public String updateProduct(HttpServletRequest request, HttpServletResponse response, ModelMap model, Product productNew) throws Exception {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        Integer id = reqInfo.getIntParameter( "id", -1 );
        if( id > 0 ){
            DWZResponse.Builder builder;
            try {
                Product product = productService.getById( id ); 
                super.copyProperties(product, productNew);
                productService.update( product ); 
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
    public String deleteProduct(HttpServletRequest request, HttpServletResponse response, ModelMap model, String inIdList) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        setRequestModelMap(request, model);
        DWZResponse.Builder builder;
        try {
            String[] idArray = inIdList.split(",");
            model.put("inIdList", idArray);
            productService.delete( model ); 
            builder = DWZResponse.getSucessBuilder("success");
        } catch (Exception e) {
            builder = DWZResponse.getFailBuilder("fail" + Arrays.deepToString(e.getStackTrace()));
        }
        RenderUtil.renderHtml(builder.build().toString(), response);
        model.clear();
        return null;
    }

    private PageList<Product> getPageList(ModelMap model) {
        PageList<Product> productList = productService.getList( model, Integer.parseInt(model.get("pageNum").toString()), Integer.parseInt(model.get("numPerPage").toString()) ); 
        model.put("productList",productList);
        model.put("pageTurn",productList.getPageTurn());
        return productList;
    }
}