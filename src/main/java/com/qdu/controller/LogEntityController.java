package com.qdu.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qdu.pojo.LogEntity;
import com.qdu.service.LogEntityService;

@Controller
@RequestMapping(value="/log")
public class LogEntityController {

	@Autowired LogEntityService logEntityServiceImpl;
	
	@RequestMapping(value="/selectAllLog")
	public String selectAllLog(ModelMap map) {
		List<LogEntity> logEntities = logEntityServiceImpl.selectLog();
		map.put("logEntitys", logEntities);
		return "superManagerPage";
	} 
}
