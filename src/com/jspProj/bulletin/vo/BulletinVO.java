package com.jspProj.bulletin.vo;

public class BulletinVO {
	private int btCode;
	private String btContent;
	private String dsName;
	private String btFileName;
	private String writer;
	
	public int getBtCode() {
		return btCode;
	}
	public void setBtCode(int btCode) {
		this.btCode = btCode;
	}
	public String getBtContent() {
		return btContent;
	}
	public void setBtContent(String btContent) {
		this.btContent = btContent;
	}
	public String getDsName() {
		return dsName;
	}
	public void setDsName(String dsName) {
		this.dsName = dsName;
	}
	public String getBtFileName() {
		return btFileName;
	}
	public void setBtFileName(String btFileName) {
		this.btFileName = btFileName;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
}
