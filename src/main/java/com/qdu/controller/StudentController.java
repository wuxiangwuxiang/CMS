package com.qdu.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.qdu.aop.SystemLog;
import com.qdu.pojo.Clazz;
import com.qdu.pojo.QrTem;
import com.qdu.pojo.Student;
import com.qdu.pojo.StudentInfo;
import com.qdu.service.ClazzService;
import com.qdu.service.CourseService;
import com.qdu.service.QrTemService;
import com.qdu.service.StudentInfoService;
import com.qdu.service.StudentService;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
	@Autowired private StudentService studentServiceImpl;
	@Autowired private ClazzService clazzServiceImpl;
	@Autowired private QrTemService qrTemServiceImpl;
	@Autowired private CourseService courseServiceImpl;
	@Autowired private StudentInfoService studentInfoServiceImpl;

	// 学生登录
	@RequestMapping(value = "/studentLogin.do")
	@SystemLog(module="学生",methods="日志管理-登录")
	public String studentLogin(HttpServletRequest request, ModelMap map) {
		String studentRoNo = request.getParameter("studentRoNo");
		String password = request.getParameter("studentPassword");
		System.out.println("正经登陆");
		Student student = studentServiceImpl.selectStudentByNo(studentRoNo);
		if(student != null){
			if(password.equals(student.getStudentPassword())){
				map.addAttribute("student", student);
				// session的id存一下
				request.getSession().setAttribute("UserId", null);
				request.getSession().setAttribute("UserId", studentRoNo);
				return "index";
			}
		}
		return "failer";
	}

	// 学生等待审核
	@RequestMapping(value = "/waitForRegister.do")
	public String waitForRegister() {
		return "waitForRegister";
	}
	//ajax验证学号是否已经存在
	@SystemLog(module="学生",methods="日志管理-验证账号")
	@RequestMapping(value = "/confirmExitsStudent.do")
	public @ResponseBody Map<String, Object> confirmExitsStudent(HttpServletRequest request,String studentRoNo) {
		System.out.println("ajax探测用户学号是否存在"+studentRoNo);
		Map<String, Object> map = new HashMap<>();
		Student student = studentServiceImpl.selectStudentByNo(studentRoNo);
		if(student == null){
			System.out.println("用户不存在");
			map.put("result", true);
		}else {
			map.put("result", false);
		}
		//request.getSession().setAttribute("UserId", null);
		request.getSession().setAttribute("UserId", studentRoNo);
		return map;
	}
	
	//通过clazz找student
	@SystemLog(module="教师",methods="日志管理-获取学生列表")
	@RequestMapping(value = "/selectStudentByClazzId.do",method = RequestMethod.POST)
	public String selectStudentByClazzId(int clazzId,ModelMap map){
		System.out.println(clazzId);
		List<Student> students = studentServiceImpl.selectStudentByClazzId(clazzId);
		int count = clazzServiceImpl.selectCountOfStudentByClazz(clazzId);
		System.out.println(count);
		Clazz clazz = clazzServiceImpl.selectClazzById(clazzId);
		map.put("clazz", clazz);
		map.put("count", count);
		map.put("student", students);
		return "studentInfo";
	}

	// 查找临时表学生信息
	@RequestMapping(value = "/selectStudentTemById.do")
	public String selectStudentTemById(ModelMap map, HttpServletRequest request) {
		String rono = request.getParameter("studentRoNo");
		Student student = studentServiceImpl.selectStudentByNo(rono);
		if (student != null) {
			map.addAttribute("student", student);
			return "showInfo";
		} else
			return "failer";
	}

	// 跳转到新建学生页面
	@RequestMapping(value = "/addStudent.do")
	public String addStudent(ModelMap map) {
		return "addStudent";
	}

	// 学生注册
	@RequestMapping(value = "/insertStudent.do", method = RequestMethod.POST)
	@SystemLog(module="学生",methods="日志管理-注册")
	public String insertTemporary(HttpServletRequest request, @RequestParam("file") MultipartFile file, ModelMap map,
			Student student) {
		String path = request.getSession().getServletContext().getRealPath("/") + "studentPhoto";
		System.out.println(path);
		String fileName = file.getOriginalFilename();
		System.out.println(fileName);
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		// 保存 
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		studentServiceImpl.insertStudentByNo(student);
		System.out.println("学生注册成功");
		
		map.put("student", student);
		System.out.println(student.getStudentGender());
		request.getSession().setAttribute("UserId", null);
		request.getSession().setAttribute("UserId", student.getStudentRoNo());
		return "waitForRegister";
	}
	
	    //注册后跳转到首页
	    @SystemLog(module="学生",methods="日志管理-学生注册成功跳转到首页")
		@RequestMapping(value="/exchangeStudent.do")
		public String exchangeStudent(String studentRoNo,ModelMap map){
			Student student = studentServiceImpl.selectStudentByNo(studentRoNo);
			map.put("student", student);
			return "index";
		}
	   //学生签到
	    @RequestMapping(value = "/insertQrTem.do")
	    @SystemLog(module="学生",methods="日志管理-学生签到")
	    @ResponseBody
	    public Map<String, Object> insertQrTem(HttpServletRequest request,String studentRoNo,
			String password, int courseId, String qrTime) throws ParseException{
	    	System.out.println("进入 ： insertQrTem.do");
	    	request.getSession().setAttribute("UserId", studentRoNo);
	    	Map<String, Object> map = new HashMap<>();
	    	List<Student> students = courseServiceImpl.selectStudentByMany(courseId);
	    	Boolean confirm = false;
	    	for(Student student:students){
	    		if(studentRoNo.equals(student.getStudentRoNo())){
	    			confirm = true;
	    		break;
	    		}
	    	}
	    	Student student = studentServiceImpl.selectStudentByNo(studentRoNo);
	    	if(confirm == false){
	    		Student student2 = studentServiceImpl.selectStudentByNo(studentRoNo);
	    		if(student2 != null){
	    			map.put("message", "您不在此课程内");
	    		}else
	    		map.put("message", "学号错误");
	    	}else if(! password.equals(student.getStudentPassword())){
	    		System.out.println(student.getStudentPassword());
				map.put("message", "密码错误");
			}else {
				System.out.println(qrTime);
				QrTem qrTem = new QrTem();
				qrTem.setCourseId(courseId);
				qrTem.setStudentRoNo(studentRoNo);
				qrTem.setQrTime(qrTime);
				qrTemServiceImpl.insertQrTem(qrTem);//插到临时表稍后删除
				map.put("message", "签到成功！");
				
			}
	    	return map;
	    }
	    //获取签到成功的学生列表
	    @SystemLog(module="教师",methods="日志管理-获取签到列表")
	    @RequestMapping(value = "/getTemStudent.do")
	    @ResponseBody
	    public Map<String, Object> getTemStudent(int courseId){
	    	System.out.println("获取签到列表");
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String currentTime = sdf.format(date);
			Map<String, Object> map = new HashMap<>();
			List<QrTem> qrTems = qrTemServiceImpl.selectQrTemByCourseIdAndTime(courseId, currentTime);
			List<Student> students = new ArrayList<>();
			if(qrTems != null){
				System.out.println("hibaby");
				for(QrTem qrTem : qrTems){
					Student student = studentServiceImpl.selectStudentAndClazzByNo(qrTem.getStudentRoNo());
					System.out.println(qrTem.getStudentRoNo());
					students.add(student);
				}
			}else{
				System.out.println("空");
			}
	    	map.put("students", students);
	    	System.out.println(9999999);
	    	return map;
	    }
	    //提交签到表
	    @SystemLog(module="教师",methods="日志管理-提交签到列表")
	    @RequestMapping(value = "/submitSignIn.do")
	    @ResponseBody
	    public Map<String, Object> submitSignIn(int courseId){
	    	System.out.println("1234567890-0");
	    	System.out.println(courseId);
	    	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			String currentTime = sdf.format(date);
	    	Map<String, Object> map = new HashMap<>();
	    	List<QrTem> qrTems = qrTemServiceImpl.selectQrTemByCourseIdAndTime(courseId, currentTime);
	    	for(QrTem qrTem : qrTems){
	    		StudentInfo studentInfo = studentInfoServiceImpl.selectStudentInfoByMany(qrTem.getStudentRoNo(), courseId);
				int tem = studentInfo.getSignIn();System.out.println(tem);
				int x = tem+1;
	    		studentInfoServiceImpl.updateStudentInfoAboutSignIn(studentInfo.getStudentInfoId(),x);
	    	    qrTemServiceImpl.deleteTemQrById(qrTem.getQrTemId());
	    	    System.out.println("id: " + qrTem.getQrTemId());
	    	}
	    	
	    	map.put("message", "成功");
	    	return map;
	    }

}
