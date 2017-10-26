package com.qdu.pojo;

import java.io.Serializable;

public class LogEntity implements Serializable{
	private int logId;
	private String userId;//登录账号
	private String module;//执行的模块
	private String method;//执行的方法
	private String reponseTime;//响应
	private String ip;//本地IP地址
	private String date;//执行的时间
	private String commite;//执行的描述
	
	
	public int getLogId() {
		return logId;
	}
	public void setLogId(int logId) {
		this.logId = logId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getReponseTime() {
		return reponseTime;
	}
	public void setReponseTime(String reponseTime) {
		this.reponseTime = reponseTime;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getCommite() {
		return commite;
	}
	public void setCommite(String commite) {
		this.commite = commite;
	}
	@Override
	public String toString() {
		return "LogEntity [logId=" + logId + ", userId=" + userId + ", module=" + module + ", method=" + method
				+ ", reponseTime=" + reponseTime + ", ip=" + ip + ", date=" + date + ", commite=" + commite + "]";
	}
	

}
