package com.shoes.controller;

import com.shoes.entity.Porder;
import com.shoes.framework.web.BaseController3;
import com.shoes.framework.web.HttpRequestInfo;
import com.shoes.service.PorderService;

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
@RequestMapping("/admin/porder")
public class PorderController extends BaseController3 {
    private static final String ROOT_VIEW = "admin/porder";

    private static final String HOME_VIEW = "admin/porder/home";

    private static final String EDIT_VIEW = "admin/porder/edit";

    @Resource
    private PorderService porderService;

    @RequestMapping()
    public String listPorder(HttpServletRequest request, ModelMap model) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        setRequestModelMap( request, model, true );
        getPageList( model );
        return HOME_VIEW;
    }

    @RequestMapping(EDIT)
    public String editPorder(HttpServletRequest request, ModelMap model) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        setRequestModelMap( request, model, false );
        Integer id = reqInfo.getIntParameter( "id", -1 );
        if( id > 0 ){
            model.put( "model",porderService.getById( id ) ); 
        }
        return EDIT_VIEW;
    }

    @RequestMapping(ADD)
    public String addPorder(HttpServletRequest request, HttpServletResponse response, ModelMap model, Porder porder) {
        setRequestModelMap(request, model, false);
        DWZResponse.Builder builder;
        try {
            porderService.insert( porder ); 
            builder = DWZResponse.getSucessBuilder("success");
        } catch (Exception e) {
            builder = DWZResponse.getFailBuilder("fail" + Arrays.deepToString(e.getStackTrace()));
        }
        RenderUtil.renderHtml(builder.build().toString(), response);
        return null;
    }

    @RequestMapping(DETAIL)
    public String detailPorder(HttpServletRequest request, ModelMap model) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        Integer id = reqInfo.getIntParameter( "id", -1 );
        if( id > 0 ){
            model.addAttribute( porderService.getById( id ) ); 
        }
        setRequestModelMap(request, model);
        return null;
    }

    @RequestMapping(UPDATE)
    public String updatePorder(HttpServletRequest request, HttpServletResponse response, ModelMap model, Porder porderNew) throws Exception {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        Integer id = reqInfo.getIntParameter( "id", -1 );
        if( id > 0 ){
            DWZResponse.Builder builder;
            try {
                Porder porder = porderService.getById( id ); 
                super.copyProperties(porder, porderNew);
                porderService.update( porder ); 
                model.clear();
                builder = DWZResponse.getSucessBuilder("success");
            } catch (Exception e) {
                builder = DWZResponse.getFailBuilder("fail" + Arrays.deepToString(e.getStackTrace()));
            }
            RenderUtil.renderHtml(builder.build().toString(), response);
        }
        return null;
    }

    @RequestMapping(AUDIT)
    public String auditPorder(HttpServletRequest request, HttpServletResponse response, ModelMap model, String inIdList) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        Integer status = reqInfo.getIntParameter( "status", -1 );
        
        setRequestModelMap(request, model);
        DWZResponse.Builder builder;
        try {
            String[] idArray = inIdList.split(",");
            model.put("inIdList", idArray);
            porderService.update( model ); 
            builder = DWZResponse.getSucessBuilder("success");
        } catch (Exception e) {
            builder = DWZResponse.getFailBuilder("fail" + Arrays.deepToString(e.getStackTrace()));
        }
        RenderUtil.renderHtml(builder.build().toString(), response);
        model.clear();
        return null;
    }

    @RequestMapping(DELETE)
    public String deletePorder(HttpServletRequest request, HttpServletResponse response, ModelMap model, String inIdList) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        setRequestModelMap(request, model);
        DWZResponse.Builder builder;
        try {
            String[] idArray = inIdList.split(",");
            model.put("inIdList", idArray);
            porderService.delete( model ); 
            builder = DWZResponse.getSucessBuilder("success");
        } catch (Exception e) {
            builder = DWZResponse.getFailBuilder("fail" + Arrays.deepToString(e.getStackTrace()));
        }
        RenderUtil.renderHtml(builder.build().toString(), response);
        model.clear();
        return null;
    }

    private PageList<Porder> getPageList(ModelMap model) {
        PageList<Porder> porderList = porderService.getList( model, Integer.parseInt(model.get("pageNum").toString()), Integer.parseInt(model.get("numPerPage").toString()) ); 
        model.put("porderList",porderList);
        model.put("pageTurn",porderList.getPageTurn());
        return porderList;
    }
}