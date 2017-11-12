package com.qdu.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.qdu.aop.SystemLog;
import com.qdu.pojo.Clazz;
import com.qdu.pojo.Course;
import com.qdu.pojo.LogEntity;
import com.qdu.pojo.Message;
import com.qdu.pojo.QrTem;
import com.qdu.pojo.Student;
import com.qdu.pojo.StudentInfo;
import com.qdu.pojo.Teacher;
import com.qdu.service.ClazzService;
import com.qdu.service.CourseService;
import com.qdu.service.LogEntityService;
import com.qdu.service.MessageService;
import com.qdu.service.QrTemService;
import com.qdu.service.StudentInfoService;
import com.qdu.service.StudentService;
import com.qdu.service.TeacherService;
import com.qdu.util.GlobalVariable;
import com.qdu.util.JavaEmailSender;
import com.qdu.util.MD5Util;
import com.qdu.util.Page;
import com.qdu.util.VertifyCodeUtil;

@Controller
@RequestMapping(value = "/student")
public class StudentController {
	@Autowired
	private StudentService studentServiceImpl;
	@Autowired
	private ClazzService clazzServiceImpl;
	@Autowired
	private QrTemService qrTemServiceImpl;
	@Autowired
	private CourseService courseServiceImpl;
	@Autowired
	private StudentInfoService studentInfoServiceImpl;
	@Autowired
	private MessageService messageServiceImpl;
	@Autowired
	private TeacherService teacherServiceImpl;
	@Autowired 
	private LogEntityService logEntityServiceImpl;

	// 学生登录
	@RequestMapping(value = "/studentLogin.do")
	@SystemLog(module = "学生", methods = "日志管理-登录")
	public String studentLogin(HttpServletRequest request, String pageNow, String studentRoNo, String password,
			ModelMap map) {
		if (studentRoNo == null) {
			studentRoNo = request.getParameter("studentRoNo");
		}
		if (password == null) {
			password = request.getParameter("studentPassword");
		}
		System.out.println("正经登陆");
		Student student2 = studentServiceImpl.selectStudentByNo(studentRoNo);
		if (student2 != null) {
			if (MD5Util.md5(password, "juin").equals(student2.getStudentPassword()) || password.equals(student2.getStudentPassword())) {
				if (pageNow == null) {
					pageNow = 1 + "";
				}
				List<LogEntity> logEntities = logEntityServiceImpl.selectStudentLog(studentRoNo);
				map.put("logEntity", logEntities);
				
				List<StudentInfo> studentInfos2 = studentInfoServiceImpl.selectStudentInfoList(studentRoNo);
				map.put("studentInfos2", studentInfos2);
				
				Page page = null;
				int totalCount = messageServiceImpl.selectMessageTotalCount(studentRoNo);
				page = new Page(totalCount, Integer.parseInt(pageNow));
				int messageCount = messageServiceImpl.selectMessageCount(studentRoNo);
				map.put("messageCount", messageCount);
				List<Message> messages = messageServiceImpl.selectUnreadMessage(studentRoNo,
						page.getStartPos());
				map.put("message", messages);
				map.put("page", page);
				
				List<StudentInfo> studentInfos = studentInfoServiceImpl.selectCourseByStudentRono(studentRoNo);
				map.addAttribute("studentInfos", studentInfos);
				map.addAttribute("student", student2);
				// session的id存一下
				request.getSession().setAttribute("UserId", null);
				request.getSession().setAttribute("UserId", studentRoNo);
				return "studentPage";
			}
		}
		return "failer";
	}

	// 学生等待审核
	@RequestMapping(value = "/waitForRegister.do")
	public String waitForRegister() {
		return "waitForRegister";
	}

	// ajax验证学号是否已经存在
	@SystemLog(module = "学生", methods = "日志管理-验证账号")
	@RequestMapping(value = "/confirmExitsStudent.do")
	public @ResponseBody Map<String, Object> confirmExitsStudent(HttpServletRequest request, String studentRoNo) {
		System.out.println("ajax探测用户学号是否存在" + studentRoNo);
		Map<String, Object> map = new HashMap<>();
		Student student = studentServiceImpl.selectStudentByNo(studentRoNo);
		if (student == null) {
			System.out.println("用户不存在");
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		request.getSession().setAttribute("UserId", studentRoNo);
		return map;
	}

	// ajax验证学生密码是否正确
	@SystemLog(module = "学生", methods = "日志管理-学生登录密码验证")
	@ResponseBody
	@RequestMapping(value = "/confirmStudentPassWord.do")
	public Map<String, Object> confirmStudentPassWord(String studentRono, String password) {
		Map<String, Object> map = new HashMap<>();
		Student student = studentServiceImpl.selectStudentByNo(studentRono);
		System.out.println(MD5Util.md5(password, "juin"));
		if (student != null && MD5Util.md5(password, "juin").equals(student.getStudentPassword())) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		return map;
	}

	// 通过clazz找student
	@SystemLog(module = "教师", methods = "日志管理-获取学生列表")
	@RequestMapping(value = "/selectStudentByClazzId.do", method = RequestMethod.POST)
	public String selectStudentByClazzId(int clazzId, ModelMap map) {
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
	@SystemLog(module = "学生", methods = "日志管理-注册")
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
		String password = request.getParameter("studentPassword");
		System.out.println(MD5Util.md5(password, "juin"));
		student.setStudentPassword(MD5Util.md5(password, "juin"));
		studentServiceImpl.insertStudentByNo(student);
		System.out.println("学生注册成功");

		map.put("student", student);
		System.out.println(student.getStudentGender());
		request.getSession().setAttribute("UserId", null);
		request.getSession().setAttribute("UserId", student.getStudentRoNo());
		return "waitForRegister";
	}

	// 注册后跳转到首页
	@SystemLog(module = "学生", methods = "日志管理-学生注册成功跳转到首页")
	@RequestMapping(value = "/exchangeStudent.do")
	public String exchangeStudent(String studentRoNo,String pageNow, ModelMap map, HttpServletRequest request) {
		Student student = studentServiceImpl.selectStudentByNo(studentRoNo);
		List<StudentInfo> studentInfos = studentInfoServiceImpl.selectCourseByStudentRono(studentRoNo);
		if (pageNow == null) {
			pageNow = 1 + "";
		}
		Page page = null;
		int totalCount = messageServiceImpl.selectMessageTotalCount(studentRoNo);
		page = new Page(totalCount, Integer.parseInt(pageNow));
		int messageCount = messageServiceImpl.selectMessageCount(studentRoNo);
		map.put("messageCount", messageCount);
		List<Message> messages = messageServiceImpl.selectUnreadMessage(studentRoNo,
				page.getStartPos());
		List<LogEntity> logEntities = logEntityServiceImpl.selectStudentLog(studentRoNo);
		map.put("logEntity", logEntities);
		List<StudentInfo> studentInfos2 = studentInfoServiceImpl.selectStudentInfoList(studentRoNo);
		map.put("studentInfos2", studentInfos2);
		map.put("message", messages);
		map.put("page", page);
		map.put("student", student);
		map.addAttribute("studentInfos", studentInfos);
		// session的id存一下
		request.getSession().setAttribute("UserId", null);
		request.getSession().setAttribute("UserId", studentRoNo);
		return "studentPage";
	}

	// 学生更改密码
	@RequestMapping(value = "/updateStudentPassWord.do")
	@SystemLog(module = "学生", methods = "日志管理-更改密码")
	public String updateStudentPassWord(Student student, ModelMap map, HttpServletRequest request) {
		MD5Util.md5(student.getStudentPassword(), "juin");
		studentServiceImpl.updateStudentPassWord(student);
		String studentRoNo = request.getParameter("studentRoNo");
		System.out.println(studentRoNo);
		Student student2 = studentServiceImpl.selectStudentByNo(studentRoNo);
		map.put("student", student2);
		System.out.println(student.getStudentGender());
		request.getSession().setAttribute("UserId", null);
		request.getSession().setAttribute("UserId", student.getStudentRoNo());
		return "waitForRegister";
	}

	// 学生更换邮箱
	@SystemLog(module = "学生", methods = "日志管理-更换邮箱")
	@RequestMapping(value = "/changeStuMail.do")
	@ResponseBody
	public Map<String, Object> changeStuMail(String oldEmail,String studentRoNo, String studentEmail) throws Exception {
		Map<String, Object> map = new HashMap<>();
		Student student = studentServiceImpl.selectStudentByNo(studentRoNo);
		String EMAIL = oldEmail;
		String TITLE = student.getStudentName() + "更换邮箱";// 标题
		String CONTENT = "新邮箱为:" + "   " + "[" + oldEmail + "]" + "\n"; // 内容
		int tem = studentServiceImpl.changeStuMail(studentRoNo, studentEmail);
		if(tem > 0){
			JavaEmailSender.sendEmail(EMAIL, TITLE, CONTENT);
			map.put("result", true);
		}else {
			map.put("result", false);
		}
		return map;
	}

	// 学生签到
	@RequestMapping(value = "/insertQrTem.do")
	@SystemLog(module = "学生", methods = "日志管理-学生签到")
	@ResponseBody
	public Map<String, Object> insertQrTem(HttpServletRequest request, String studentRoNo, String password,
			int courseId, String qrTime, int validateCode) throws ParseException {
		System.out.println("进入 ： insertQrTem.do");
		request.getSession().setAttribute("UserId", studentRoNo);
		Map<String, Object> map = new HashMap<>();
		List<Student> students = courseServiceImpl.selectStudentByMany(courseId);
		Boolean confirm = false;
		for (Student student : students) {
			if (studentRoNo.equals(student.getStudentRoNo())) {
				confirm = true;
				break;
			}
		}
		Student student = studentServiceImpl.selectStudentByNo(studentRoNo);
		if (confirm == false) {
			Student student2 = studentServiceImpl.selectStudentByNo(studentRoNo);
			if (student2 != null) {
				map.put("message", "您不在此课程内");
			} else
				map.put("message", "学号错误");
		} else if (!MD5Util.md5(password, "juin").equals(student.getStudentPassword())) {
			System.out.println(student.getStudentPassword());
			map.put("message", "密码错误");
		} else {
			QrTem tem = qrTemServiceImpl.selectQrTemByStuNoAndCourseId(studentRoNo, courseId);
			if (tem != null) {
				map.put("message", "请勿重复签到");
			} else {
				if (GlobalVariable.returnCode() != validateCode) {
					map.put("message", "验证码有误");
				} else {
					QrTem qrTem = new QrTem();
					qrTem.setCourseId(courseId);
					qrTem.setStudentRoNo(studentRoNo);
					qrTem.setQrTime(qrTime);
					qrTemServiceImpl.insertQrTem(qrTem);// 插到临时表稍后删除
					map.put("message", "签到成功！");
				}
			}
		}
		return map;
	}

	// 获取签到成功的学生列表
	@SystemLog(module = "教师", methods = "日志管理-获取签到列表")
	@RequestMapping(value = "/getTemStudent.do")
	@ResponseBody
	public Map<String, Object> getTemStudent(int courseId) {
		System.out.println("获取签到列表");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String currentTime = sdf.format(date);
		Map<String, Object> map = new HashMap<>();
		List<QrTem> qrTems = qrTemServiceImpl.selectQrTemByCourseIdAndTime(courseId, currentTime);
		List<Student> students = new ArrayList<>();
		if (qrTems != null && qrTems.size() != 0) {
			for (QrTem qrTem : qrTems) {
				Student student = studentServiceImpl.selectStudentAndClazzByNo(qrTem.getStudentRoNo());
				students.add(student);
			} 
		} else {
			System.out.println("空");
		}
		map.put("students", students);
		return map;
	}

	// 提交签到表
	@SystemLog(module = "教师", methods = "日志管理-提交签到列表")
	@RequestMapping(value = "/submitSignIn.do")
	@ResponseBody
	public Map<String, Object> submitSignIn(int courseId) {
		System.out.println("提交签到表");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String currentTime = sdf.format(date);
		Map<String, Object> map = new HashMap<>();
		List<StudentInfo> studentInfos = studentInfoServiceImpl.selectInfoList(courseId);
		Map<String, Integer> map2 = new HashMap<>();
		for (StudentInfo studentInfo : studentInfos) {
			map2.put(studentInfo.getStudent().getStudentRoNo(), 0);
		}
		List<QrTem> qrTems = qrTemServiceImpl.selectQrTemByCourseIdAndTime(courseId, currentTime);
		if (qrTems.isEmpty()) {
			map.put("message", "暂无学生签到");
		} else {
			for (QrTem qrTem : qrTems) {
				StudentInfo studentInfo = studentInfoServiceImpl.selectStudentInfoByMany(qrTem.getStudentRoNo(),
						courseId);
				map2.put(qrTem.getStudentRoNo(), 1);
				int tem = studentInfo.getSignIn();
				int x = tem + 1;
				// 核心：跟新info表，成功+1
				studentInfoServiceImpl.updateStudentInfoAboutSignIn(studentInfo.getStudentInfoId(), x);
				// 删除在QrTem表中的记录，等待下次签到
				qrTemServiceImpl.deleteTemQrById(qrTem.getQrTemId());
				System.out.println("id: " + qrTem.getQrTemId());
			}
			// 旷课不来的自动将旷课字段+1
			for (String string : map2.keySet()) {
				if (map2.get(string) == 0) {
					StudentInfo studentInfo = studentInfoServiceImpl.selectStudentInfoByMany(string, courseId);
					int tem = studentInfo.getAbsenteeism();
					int x = tem + 1;
					studentInfoServiceImpl.updateStudentInfoAboutAbs(studentInfo.getStudentInfoId(), x);
				}
			}
			map.put("message", "成功");
		}
		return map;
	}

	// 签到数字（util类获取四位随机数）
	@SystemLog(module = "教师", methods = "日志管理-获取签到数字")
	@RequestMapping(value = "/getVertifyCode.do")
	@ResponseBody
	public Map<String, Object> getVertifyCode() {
		int code = VertifyCodeUtil.getVertifyCode();
		GlobalVariable globalVariable = new GlobalVariable(code);
		System.out.println(globalVariable.returnCode() + " ：寻人不知归处");
		Map<String, Object> map = new HashMap<>();
		map.put("code", code);
		return map;
	}

	// 学生找回密码
	@SystemLog(module = "学生", methods = "日志管理-找回密码(跳转)")
	@RequestMapping(value = "/getStudentPasswordBack.do")
	public String getStudentPasswordBack() {
		return "studentGetPasswordBack";
	}

	// 学生找回密码前的账号验证
	@SystemLog(module = "学生", methods = "日志管理-找回密码(验证+临时密码发放)")
	@RequestMapping(value = "/forStudentReGetPass.do")
	@ResponseBody
	public Map<String, Object> forStudentReGetPass(String studentRoNo, String name, String mobile, String mail,
			HttpServletRequest request) throws Exception {
		System.out.println("进来验证");
		Student student = studentServiceImpl.selectStudentByFour(studentRoNo, name, mobile, mail);
		Map<String, Object> map = new HashMap<>();
		if (student != null) {
			Random random = new Random();
			char a1 = (char) (random.nextInt(24) + 97);
			char a2 = (char) (random.nextInt(14) + 97);
			int x = random.nextInt(9000) + 1000;
			String cc = a1 + "" + x + a2;
			System.out.println(cc);
			studentServiceImpl.ajaxupdateStudentPassWord(studentRoNo, cc);
			String EMAIL = mail;
			String TITLE = student.getStudentName() + ",找回密码";// 标题
			String CONTENT = "临时密码为:" + "   " + "[" + cc + "]" + "\n" + "为了安全，请尽快使用此密码登录后修改密码"; // 内容
			JavaEmailSender.sendEmail(EMAIL, TITLE, CONTENT);
			map.put("result", true);
		} else {
			map.put("result", false);
			System.out.println("查无此人");
		}
		return map;
	}

	// ajax学生添加课程发信息给老师
	@SystemLog(module = "学生", methods = "日志管理-添加课程")
	@RequestMapping(value = "/atudentAddCourse.do")
	@ResponseBody
	public Map<String, Object> atudentAddCourse(int clazzId,String studentRono, String courseName, int courseId) {
		Map<String, Object> map = new HashMap<>();
		String time = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss").format(new Date());
		Course course = courseServiceImpl.selectCourseById(courseId);
		Teacher teacher = course.getTeacher();
		Clazz clazz = clazzServiceImpl.selectClazzById(clazzId);
		Student student = studentServiceImpl.selectStudentByNo(studentRono);
		Message message = new Message();
		message.setMessageSender(studentRono);
		message.setMessageAccepter(teacher.getTeacherMobile());
		message.setMessageTitle(student.getStudentName() + "同学("+clazz.getClazzName()+")申请加入课程： " + course.getCourseName() + "("
				+ course.getCurrentYear() + "/" + course.getSchoolTem() + ")");
		message.setSendTime(time);
		message.setHaveRead("未读");
		message.setMessageType("insertCourse");
		message.setMessageContent(courseId + "c" + clazz.getClazzId());
		messageServiceImpl.insertMessage(message);
		map.put("result", true);
		return map;
	}
	// ajax获取消息数量
		@RequestMapping(value = "/gggetMessageCount.do")
		@ResponseBody
		public Map<String, Object> gggetMessageCount(String studentRoNo) {
			Map<String, Object> map = new HashMap<>();
			int messages = messageServiceImpl.selectMessageCount(studentRoNo);
			map.put("message", messages);
			return map;
		}
		// 查看具体消息
		@SystemLog(module = "学生", methods = "日志管理-查看消息")
		@RequestMapping(value = "/getMessageByAjax.do")
		@ResponseBody
		public Map<String, Object> getMessageByAjax(int messageId) {
			Map<String, Object> map = new HashMap<>();
			messageServiceImpl.uodateMesageHaveread(messageId);
			Message message = messageServiceImpl.selectMessageById(messageId);
			Course course = courseServiceImpl.selectCourseById(Integer.parseInt(message.getMessageContent()));
			if(course != null){
				Teacher teacher2 = course.getTeacher();
				map.put("teacher", teacher2);
			}
			map.put("mmm", message);
			System.out.println(map);
			return map;
		}
		//ajax更新学生信息
		@SystemLog(module = "学生", methods = "日志管理-刷新信息")
		@RequestMapping(value = "/updateStudentInfoByAjax.do")
		@ResponseBody
		public Map<String, Object> updateStudentInfoByAjax(String studentRono,String college,String special,
				@DateTimeFormat(pattern = "yyyy") Date intoSchoolYear,String schoolRecord,@DateTimeFormat(pattern = "yyyy-MM-dd") Date birthDay,String freeStyle){
			Map<String, Object> map = new HashMap<>();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
			SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd");
			Student student  =studentServiceImpl.selectStudentByNo(studentRono);
			if(college != null){
			student.setCollege(college);
			}
			if(special != null){
			student.setSpecial(special);
			}
			if(birthDay != null){
			student.setBirthDay(sdf2.format(birthDay));
			}
			if(freeStyle != null){
			student.setFreeStyle(freeStyle);
			}
			if(schoolRecord != null){
			student.setSchoolRecord(schoolRecord);
			}
			if(intoSchoolYear != null){
			student.setIntoSchoolYear(Integer.parseInt(sdf.format(intoSchoolYear)));
			}
			int tem = studentServiceImpl.updateStudentextra(student);
			if(tem > 0){
				map.put("result", true);
			}else {
				map.put("result", false);
			}
			return map;
		}
		//ajax查询日志记录通过时间
		@SystemLog(module = "学生", methods = "日志管理-通过时间查询日志")
		@RequestMapping(value = "/searchStudentLogByTime.do")
		@ResponseBody
		public Map<String, Object> searchStudentLogByTime(String logDate,String studentRono){
			Map<String, Object> map = new HashMap<>();
			List<LogEntity> logEntities = logEntityServiceImpl.selectStudentLogByTime(studentRono, logDate);
			map.put("logEntities", logEntities);
			return map;
		}
		

}