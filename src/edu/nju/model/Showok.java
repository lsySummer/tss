package edu.nju.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="showok")
public class Showok  implements Serializable{
	@Id  
	private int id; 
	private int state;
	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public int getId(){
		return id;
	}
	
	public void setId(int id){
		this.id = id;
	}
	String sid;
	int hid;
	int score;
	int pScore;
	public int getpScore() {
		return pScore;
	}

	public void setpScore(int pScore) {
		this.pScore = pScore;
	}
	String hpath;
	public String getHpath() {
		return hpath;
	}

	public void setHpath(String hpath) {
		this.hpath = hpath;
	}

	String review;
	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	public Showok(){
		
	}
}
