package com.qdu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import com.qdu.pojo.Clazz;
import com.qdu.service.ClazzService;

@Controller
@RequestMapping(value = "/clazz")
public class ClazzController {

	@Autowired
	private ClazzService clazzServiceImpl;
	
	@RequestMapping(value = "/forInsertClazz.do")
	public String forInsertClazz(){
		return "clazzInfo";
	}
	
	@RequestMapping(value = "/insertClazz.do")
	public String insertClazz(ModelMap map,Clazz clazz){
		clazzServiceImpl.insertClazz(clazz);
		return "clazzInfo";
	}
}
