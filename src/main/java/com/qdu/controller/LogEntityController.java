package com.qdu.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.qdu.pojo.Admin;
import com.qdu.pojo.LogEntity;
import com.qdu.service.LogEntityService;
//超级管理员+相关操作
@Controller
@RequestMapping(value="/admin")
public class LogEntityController {

	@Autowired LogEntityService logEntityServiceImpl;
	//超管准备登录
	@RequestMapping(value="/forAdminLogin.do")
	public String forAdminLogin(ModelMap map) {
		return "adminPage";
	} 
	
	//超级管理员登录
	@RequestMapping(value = "/adminLogin.do",method=RequestMethod.POST)
	public String adminLogin(ModelMap map,HttpServletRequest request){
		String adminId = request.getParameter("adminId");
		String adminPassword = request.getParameter("adminPassword");
		Admin admin = logEntityServiceImpl.selectAdminById(adminId);
		if(adminPassword.equals(admin.getAdminPassword())){
			List<LogEntity> logEntities = logEntityServiceImpl.selectLog();
			map.put("admin", admin);
			map.put("logEntitys", logEntities);
			return "superManagerPage";
		}
		else {
			return "failer";
		}
	}
	
	@RequestMapping(value="/selectAllLog.do")
	public String selectAllLog(ModelMap map) {
		List<LogEntity> logEntities = logEntityServiceImpl.selectLog();
		map.put("logEntitys", logEntities);
		return "superManagerPage";
	} 
}
