package com.shoes.controller;

import com.shoes.entity.ShoppingCart;
import com.shoes.framework.web.BaseController3;
import com.shoes.framework.web.HttpRequestInfo;
import com.shoes.service.ShoppingCartService;

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
@RequestMapping("/admin/shoppingCart")
public class ShoppingCartController extends BaseController3 {
    private static final String ROOT_VIEW = "admin/shoppingCart";

    private static final String HOME_VIEW = "admin/shoppingCart/home";

    private static final String EDIT_VIEW = "admin/shoppingCart/edit";

    @Resource
    private ShoppingCartService shoppingCartService;

    @RequestMapping()
    public String listShoppingCart(HttpServletRequest request, ModelMap model) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        setRequestModelMap( request, model, true );
        getPageList( model );
        return HOME_VIEW;
    }

    @RequestMapping(EDIT)
    public String editShoppingCart(HttpServletRequest request, ModelMap model) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        setRequestModelMap( request, model, false );
        Integer id = reqInfo.getIntParameter( "id", -1 );
        if( id > 0 ){
            model.put( "model",shoppingCartService.getById( id ) ); 
        }
        return EDIT_VIEW;
    }

    @RequestMapping(ADD)
    public String addShoppingCart(HttpServletRequest request, HttpServletResponse response, ModelMap model, ShoppingCart shoppingCart) {
        setRequestModelMap(request, model, false);
        DWZResponse.Builder builder;
        try {
            shoppingCartService.insert( shoppingCart ); 
            builder = DWZResponse.getSucessBuilder("success");
        } catch (Exception e) {
            builder = DWZResponse.getFailBuilder("fail" + Arrays.deepToString(e.getStackTrace()));
        }
        RenderUtil.renderHtml(builder.build().toString(), response);
        return null;
    }

    @RequestMapping(DETAIL)
    public String detailShoppingCart(HttpServletRequest request, ModelMap model) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        Integer id = reqInfo.getIntParameter( "id", -1 );
        if( id > 0 ){
            model.addAttribute( shoppingCartService.getById( id ) ); 
        }
        setRequestModelMap(request, model);
        return null;
    }

    @RequestMapping(UPDATE)
    public String updateShoppingCart(HttpServletRequest request, HttpServletResponse response, ModelMap model, ShoppingCart shoppingCartNew) throws Exception {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        Integer id = reqInfo.getIntParameter( "id", -1 );
        if( id > 0 ){
            DWZResponse.Builder builder;
            try {
                ShoppingCart shoppingCart = shoppingCartService.getById( id ); 
                super.copyProperties(shoppingCart, shoppingCartNew);
                shoppingCartService.update( shoppingCart ); 
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
    public String deleteShoppingCart(HttpServletRequest request, HttpServletResponse response, ModelMap model, String inIdList) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        setRequestModelMap(request, model);
        DWZResponse.Builder builder;
        try {
            String[] idArray = inIdList.split(",");
            model.put("inIdList", idArray);
            shoppingCartService.delete( model ); 
            builder = DWZResponse.getSucessBuilder("success");
        } catch (Exception e) {
            builder = DWZResponse.getFailBuilder("fail" + Arrays.deepToString(e.getStackTrace()));
        }
        RenderUtil.renderHtml(builder.build().toString(), response);
        model.clear();
        return null;
    }

    private PageList<ShoppingCart> getPageList(ModelMap model) {
        PageList<ShoppingCart> shoppingCartList = shoppingCartService.getList( model, Integer.parseInt(model.get("pageNum").toString()), Integer.parseInt(model.get("numPerPage").toString()) ); 
        model.put("shoppingCartList",shoppingCartList);
        model.put("pageTurn",shoppingCartList.getPageTurn());
        return shoppingCartList;
    }
}