package com.vo;

public class FileVo {

	String fileName;
	String fileRealName;
	String UserID;
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	public String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		UserID = userID;
	}
	
	public FileVo(String fileName, String fileRealName, String userID) {
		super();
		this.fileName = fileName;
		this.fileRealName = fileRealName;
		UserID = userID;
	}
	
	

	
}
