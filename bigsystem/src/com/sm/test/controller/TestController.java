package com.sm.test.controller;
/**
 * @author lizj_sd:
 * 
 */
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.apache.log4j.Logger;  
import com.sm.test.service.TestService;

@Controller
@RequestMapping(value = "jsp/smm/test")
public class TestController{
	@Resource(name="testService")
	private TestService testService;
	
	private static Logger log = Logger.getLogger(TestController.class); 
	
	
	@RequestMapping(value = "/test.do")
	public ModelAndView myMethod(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelMap modelMap = new ModelMap();
		modelMap.addAttribute("loginInfo", "123");
		List dataList = new ArrayList();
		dataList=testService.getAllData();
//		CommDao dao = (CommDao)SpringContextFactory.getBean("commDao");
		System.out.println("dataList==:\n"+dataList);
		modelMap.addAttribute("datalist", dataList);
		return new ModelAndView("smm/test/table", modelMap);
	}

	@RequestMapping(value = "/welcome.do")
	public void registPost(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		System.out.println("welcome");
		response.getWriter().print("welcome");
	}
}
