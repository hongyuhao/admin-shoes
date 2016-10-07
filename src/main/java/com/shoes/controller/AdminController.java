package com.shoes.controller;

import com.shoes.framework.web.BaseController3;
import com.shoes.framework.web.HttpRequestInfo;
import com.shoes.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * User Controller
 */
@Controller
public class AdminController extends BaseController3 {
	
	private static final Logger log = LoggerFactory.getLogger(AdminController.class);
	
    private static final String LOGIN = "/login";
	
	private final static String LOGON = "/logon";

    private static final String INDEX = "/index";

	private static final String INDEX_VIEW = "index";

    private static final String LOGON_VIEW = "login";

    private static final String LOGOUT = "/admin/logout";

    private final static String REDIRECT_LOGON = "redirect:/admin/logon";

    @RequestMapping(LOGON)
    public String logon(HttpServletRequest request){
        HttpRequestInfo httpRequest = new HttpRequestInfo(request);
        String retUrl = httpRequest.getParameter("retUrl");
        String url = httpRequest.getParameter("jsp");
        request.setAttribute("ReturnUrl", retUrl);

        if(!StringUtil.isEmpty(url)){
            return url ;
        }
        return LOGON_VIEW;
    }


	@RequestMapping(INDEX)
	public String index(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		setRequestModelMap(request, model, true);
		
		HttpRequestInfo reqInfo = new HttpRequestInfo(request);
		String view = reqInfo.getParameter("view", INDEX_VIEW);
		try {
			model.addAttribute("view", view);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return view;
	}
}