package com.qdu.util;

public class GlobalVariable {
	static int code;
	public GlobalVariable(int code){
		this.code = code;
	}
  public static int returnCode(){
	  return code;
  }
}
