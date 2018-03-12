package com.core;
/**
 * @author lizj_sd:
 * @version createDate：2016-7-4 上午11:17:55
 * 
 */
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter implements Filter {
	protected FilterConfig filterConfig = null;
	
	private String redirectURL = null;

	private String sessionKey = null;
	
    public void init(FilterConfig filterConfig) throws ServletException {
    	this.filterConfig = filterConfig;
		redirectURL = filterConfig.getInitParameter("RedirectURL");
		sessionKey = filterConfig.getInitParameter("SessionKey");
    }

    public void doFilter(ServletRequest request, ServletResponse response,
            FilterChain chain) throws IOException, ServletException {
        // 获得在下面代码中要用的request,response,session对象
        HttpServletRequest servletRequest = (HttpServletRequest) request;
        HttpServletResponse servletResponse = (HttpServletResponse) response;
        ((HttpServletResponse) servletResponse).setHeader("Cache-Control","no-cache");    
	    ((HttpServletResponse) servletResponse).setHeader("Pragma","no-cache");    
	    ((HttpServletResponse) servletResponse).setDateHeader ("Expires", -1); 
        HttpSession session = servletRequest.getSession();

        String path = servletRequest.getRequestURI();
        
        String loginId = (String) session.getAttribute(sessionKey);
        if(path.indexOf(redirectURL) > -1) {
            chain.doFilter(request, response);
            return;
        }
        
        if (loginId == null || "".equals(loginId)) {
            servletResponse.sendRedirect(servletRequest.getContextPath()+redirectURL);
        } else {
            chain.doFilter(request, response);
        }
    
    }

    public void destroy() {
        // TODO Auto-generated method stub
    }

}