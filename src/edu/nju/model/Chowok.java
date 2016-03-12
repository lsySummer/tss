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

	public String getEva() {
		return comment;
	}

	public void setEva(String comment) {
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
