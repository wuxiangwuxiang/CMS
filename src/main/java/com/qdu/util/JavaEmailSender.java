package com.qdu.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
import com.sun.mail.util.MailSSLSocketFactory;
 
public class JavaEmailSender {
 
 
  public static void sendEmail(String toEmailAddress,String emailTitle,String emailContent)throws Exception{
    Properties props = new Properties();
 
    // 开启debug调试
    props.setProperty("mail.debug", "true");
    // 发送服务器需要身份验证
    props.setProperty("mail.smtp.auth", "true");
    // 设置邮件服务器主机名
    props.setProperty("mail.host", "smtp.qq.com");
    // 发送邮件协议名称
    props.setProperty("mail.transport.protocol", "smtp");
 
    /**SSL认证，注意腾讯邮箱是基于SSL加密的，所有需要开启才可以使用**/
    MailSSLSocketFactory sf = new MailSSLSocketFactory();
    sf.setTrustAllHosts(true);
    props.put("mail.smtp.ssl.enable", "true");
    props.put("mail.smtp.ssl.socketFactory", sf);
 
    //创建会话
    Session session = Session.getInstance(props);
 
    //发送的消息，基于观察者模式进行设计的
    Message msg = new MimeMessage(session);
    msg.setSubject(emailTitle);
    //使用StringBuilder，因为StringBuilder加载速度会比String快，而且线程安全性也不错(不如StringBuffer)
    StringBuilder builder = new StringBuilder();
    builder.append("\n"+emailContent);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    builder.append("\n时间 " + sdf.format(new Date()));
    msg.setText(builder.toString());
    msg.setFrom(new InternetAddress("1185547466@qq.com"));
 
    Transport transport = session.getTransport();
    transport.connect("smtp.qq.com", "1185547466@qq.com", "oppcibaohhsjffaa");
    //发送消息
    transport.sendMessage(msg, new Address[] { new InternetAddress(toEmailAddress) });
    transport.close();
  }
}

//邮箱的话基于腾讯的QQ邮箱，其实也是Foxmail邮箱
//先要了解一下SMTP协议和SSL加密 
//SMTP：称为简单邮件传输协议（Simple Mail Transfer Protocal），目标是向用户提供高效、可靠的邮件传输。SMTP是一种请求响应的协议，
//也就是客户机向远程服务器发送请求，服务器响应，监听端口是25，所以其工作模式有两种：发送SMTP，接收SMTP。
//SSL加密：用来保障浏览器和网站服务器的安全性，其原理用译文解释就是： 
//当你的浏览器向服务器请求一个安全的网页(通常是 https://)
//服务器就把它的证书和公匙发回来
//浏览器检查证书是不是由可以信赖的机构颁发的，确认证书有效和此证书是此网站的。
//使用公钥加密了一个随机对称密钥，包括加密的URL一起发送到服务器
//服务器用自己的私匙解密了你发送的钥匙。然后用这把对称加密的钥匙给你请求的URL链接解密。
//服务器用你发的对称钥匙给你请求的网页加密。你也有相同的钥匙就可以解密发回来的网页了