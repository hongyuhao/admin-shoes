package com.shoes.controller;


import com.shoes.entity.User;
import com.shoes.framework.web.BaseController3;
import com.shoes.framework.web.HttpRequestInfo;
import com.shoes.service.UserService;

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
@RequestMapping("/admin/user")
public class UserController extends BaseController3 {
    private static final String ROOT_VIEW = "admin/user";

    private static final String HOME_VIEW = "admin/user/home";

    private static final String EDIT_VIEW = "admin/user/edit";

    @Resource
    private UserService userService;

    @RequestMapping()
    public String listUser(HttpServletRequest request, ModelMap model) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        setRequestModelMap( request, model, true );
        if(model.containsKey("lkUsername")) {
            model.put("likeUsername", "%" + reqInfo.getParameter("lkUsername") + "%");
        }
        getPageList( model );
        return HOME_VIEW;
    }

    @RequestMapping(EDIT)
    public String editUser(HttpServletRequest request, ModelMap model) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        setRequestModelMap( request, model, false );
        Integer id = reqInfo.getIntParameter( "id", -1 );
        if( id > 0 ){
            model.put( "model",userService.getById( id ) ); 
        }
        return EDIT_VIEW;
    }

    @RequestMapping(ADD)
    public String addUser(HttpServletRequest request, HttpServletResponse response, ModelMap model, User user) {
        setRequestModelMap(request, model, false);
        DWZResponse.Builder builder;
        try {
            userService.insert( user ); 
            builder = DWZResponse.getSucessBuilder("success");
        } catch (Exception e) {
            builder = DWZResponse.getFailBuilder("fail" + Arrays.deepToString(e.getStackTrace()));
        }
        RenderUtil.renderHtml(builder.build().toString(), response);
        return null;
    }

    @RequestMapping(DETAIL)
    public String detailUser(HttpServletRequest request, ModelMap model) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        Integer id = reqInfo.getIntParameter( "id", -1 );
        if( id > 0 ){
            model.addAttribute( userService.getById( id ) ); 
        }
        setRequestModelMap(request, model);
        return null;
    }

    @RequestMapping(UPDATE)
    public String updateUser(HttpServletRequest request, HttpServletResponse response, ModelMap model, User userNew) throws Exception {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        Integer id = reqInfo.getIntParameter( "id", -1 );
        if( id > 0 ){
            DWZResponse.Builder builder;
            try {
                User user = userService.getById( id ); 
                super.copyProperties(user, userNew);
                userService.update( user ); 
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
    public String deleteUser(HttpServletRequest request, HttpServletResponse response, ModelMap model, String inIdList) {
        HttpRequestInfo reqInfo = new HttpRequestInfo(request);
        setRequestModelMap(request, model);
        DWZResponse.Builder builder;
        try {
            String[] idArray = inIdList.split(",");
            model.put("inIdList", idArray);
            userService.delete( model ); 
            builder = DWZResponse.getSucessBuilder("success");
        } catch (Exception e) {
            builder = DWZResponse.getFailBuilder("fail" + Arrays.deepToString(e.getStackTrace()));
        }
        RenderUtil.renderHtml(builder.build().toString(), response);
        model.clear();
        return null;
    }

    private PageList<User> getPageList(ModelMap model) {
        PageList<User> userList = userService.getList( model, Integer.parseInt(model.get("pageNum").toString()), Integer.parseInt(model.get("numPerPage").toString()) ); 
        model.put("userList",userList);
        model.put("pageTurn",userList.getPageTurn());
        return userList;
    }
}