package edu.nju.model;

import java.io.Serializable;

public class Stock implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -8532407844976428920L;
	private int sid;
	private int cid;
	private int hwid;
	private String cname;
	private int state;
	
	public Stock(int sid,int cid,int hwid,String cname,int state){
		this.sid = sid;
		this.cid = cid;
		this.hwid = hwid;
		this.cname = cname;
		this.state = state;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getHwid() {
		return hwid;
	}
	public void setHwid(int hwid) {
		this.hwid = hwid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}

}
