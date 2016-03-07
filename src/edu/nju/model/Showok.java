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
	public int getId(){
		return id;
	}
	
	public void setId(int id){
		this.id = id;
	}
	int sid;
	int hid;
	int state;
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getHid() {
		return hid;
	}
	public void setHid(int hid) {
		this.hid = hid;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Showok(){
		
	}
}
