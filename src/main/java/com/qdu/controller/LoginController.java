package com.qdu.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.qdu.pojo.Test;
import com.qdu.service.TestService;

@Controller
public class LoginController {
 
	@Autowired 
	private TestService testServiceImpl;

	// 模板测试登录用
	@RequestMapping(value = "/login.do")
	public String lllogin(ModelMap map, HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		Test test = testServiceImpl.selectTestById(Integer.parseInt(id));
		if (test != null) {
			if (test.getStudentPassword().equals(password)) {
//				System.out.println(request.getContextPath());
				map.addAttribute("name", test.getStudentName());
				// session的id存一下
				request.getSession().setAttribute("UserId", id);
				return "studentPage";
			} else
				return "failer";
		} else {
			return "failer";
		}
	}
}
