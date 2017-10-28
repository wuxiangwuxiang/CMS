package com.qdu.qr;

import java.io.File;
import java.util.Hashtable;

import javax.servlet.http.HttpServletRequest;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;

public class SignInQr {
	String text;
	String time;
	String teacherName;
	public SignInQr(String text,String time,String teacherName) {
		this.text = text;
		this.time = time;
		this.teacherName = teacherName;
	}

	public String createQR(HttpServletRequest request) throws Exception{
		// 此处为二维码的jsp链接
		int width = 300;
		int height = 300;
		String format = "gif";
		Hashtable hints = new Hashtable();
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
		System.out.println(text);
		BitMatrix bitMatrix = new MultiFormatWriter().encode(text, BarcodeFormat.QR_CODE, width, height, hints);
		String path = request.getSession().getServletContext().getRealPath("/") + "qrImg";
		System.out.println("二维码路径: "+path);
		String fileName = time + "_" + teacherName;
		File outputFile = new File(path, fileName + ".gif");
		if (!outputFile.exists()) {
			outputFile.mkdirs();
		}
//		File outputFile = new File("d:" + File.separator + "new.gif");
		QRUtil.writeToFile(bitMatrix, format, outputFile);
		return fileName;
	}
}
