package com.qdu.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.qdu.pojo.Test;
import com.qdu.service.TestService;
//拦截专用Controller
@Controller
@RequestMapping(value="/anna")
public class TestController {
	
	@Autowired
	private TestService testServiceImpl;
	
	@RequestMapping(value="/exchange.do")
	    public String exchange(ModelMap map, HttpServletRequest request){
		    Test test = testServiceImpl.selectTestById(100004);
		    map.put("test", test);
			return "testJsp";
	}
	//教师登录接受拦截
	@RequestMapping(value="/teacherLogin.do")
	    public String teacherLogin(ModelMap map, HttpServletRequest request){
		    Test test = testServiceImpl.selectTestById(100004);
		    map.put("test", test);
			return "testJsp";
	}

}
