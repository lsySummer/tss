package edu.nju.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="chowok")
public class Chowok  implements Serializable{
	@Id  
	private int id;  
	int cid;
	int hid;
	String sddl;
	String egfilepath;
	private String failReason;
	private int failTime;
	private int ifpass;
	private int assisSubmit;
	private int ifOntime;
	private int month;
	
	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getIfOntime() {
		return ifOntime;
	}

	public void setIfOntime(int ifOntime) {
		this.ifOntime = ifOntime;
	}

	public int getAssisSubmit() {
		return assisSubmit;
	}

	public void setAssisSubmit(int assisSubmit) {
		this.assisSubmit = assisSubmit;
	}

	public int getIfpass() {
		return ifpass;
	}

	public void setIfpass(int ifpass) {
		this.ifpass = ifpass;
	}

	public String getFailReason() {
		return failReason;
	}

	public void setFailReason(String failReason) {
		this.failReason = failReason;
	}

	public int getFailTime() {
		return failTime;
	}

	public void setFailTime(int failTime) {
		this.failTime = failTime;
	}
	
	public String getEgfilepath() {
		return egfilepath;
	}

	public void setEgfilepath(String egfilepath) {
		this.egfilepath = egfilepath;
	}

	public String getSddl() {
		return sddl;
	}

	public void setSddl(String sddl) {
		this.sddl = sddl;
	}

	public String getAddl() {
		return addl;
	}

	public void setAddl(String addl) {
		this.addl = addl;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getDif() {
		return dif;
	}

	public void setDif(int dif) {
		this.dif = dif;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	String addl;
	String format;
	int score;
	int dif;
	String comment;
	String info;
	
	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getId(){
		return id;
	}
	
	public void setId(int id){
		this.id = id;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	
	public Chowok(){
		
	}
	
}
