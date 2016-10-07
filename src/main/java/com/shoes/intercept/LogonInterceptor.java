package com.shoes.intercept;


import com.shoes.framework.web.HttpRequestInfo;
import com.shoes.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *	如果verify为空，则需要登陆
 */
public class LogonInterceptor extends HandlerInterceptorAdapter {

	private Logger log = LoggerFactory.getLogger(LogonInterceptor.class);
	private String loginURL;

	public String getLoginURL() {
		return loginURL;
	}

	public void setLoginURL(String loginURL) {
		this.loginURL = loginURL;
	}
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		try {

			HttpRequestInfo reqInfo = new HttpRequestInfo(request);
			String verifyCookie = reqInfo.getCookieValue("verifyFlg", "");
			if(StringUtil.isEmpty(verifyCookie)) {
				response.sendRedirect(this.loginURL);
				return false;
			}
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}

		return true;
	}

}