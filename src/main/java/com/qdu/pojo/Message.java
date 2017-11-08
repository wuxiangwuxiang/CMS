package com.qdu.pojo;

import java.io.Serializable;

@SuppressWarnings("serial") 
public class Message implements Serializable{
	private int messageId;
	private String messageSender;
	private String messageAccepter;
	private String messageTitle;
	private String sendTime;
	private String haveRead;
	private String messageContent;
	private String messageType;
	
	
	
	public int getMessageId() {
		return messageId;
	}
	public void setMessageId(int messageId) {
		this.messageId = messageId;
	}
	public String getMessageSender() {
		return messageSender;
	}
	public void setMessageSender(String messageSender) {
		this.messageSender = messageSender;
	}
	public String getMessageAccepter() {
		return messageAccepter;
	}
	public void setMessageAccepter(String messageAccepter) {
		this.messageAccepter = messageAccepter;
	}
	
	public String getMessageTitle() {
		return messageTitle;
	}
	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	
	public String getHaveRead() {
		return haveRead;
	}
	public void setHaveRead(String haveRead) {
		this.haveRead = haveRead;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public String getMessageType() {
		return messageType;
	}
	public void setMessageType(String messageType) {
		this.messageType = messageType;
	} 
	@Override
	public String toString() {
		return "Message [messageId=" + messageId + ", messageSender=" + messageSender + ", messageAccepter="
				+ messageAccepter + ", messageTitle=" + messageTitle + ", sendTime=" + sendTime + ", haveRead="
				+ haveRead + ", messageContent=" + messageContent + ", messageType=" + messageType + "]";
	}
	
	
}
