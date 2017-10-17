package com.qdu.pojo; 

public class Test {
	private int studentId;
	private String studentPassword;
	private String studentName;
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	
	public String getStudentPassword() {
		return studentPassword;
	}
	public void setStudentPassword(String studentPassword) {
		this.studentPassword = studentPassword;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	@Override
	public String toString() {
		return "Test [studentId=" + studentId + ", studentPassword=" + studentPassword + ", studentName=" + studentName
				+ "]";
	}
	
	
	

}
