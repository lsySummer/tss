package edu.nju.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="cselect")
public class Cselect implements Serializable{
	@Id  
	private int id; 
	public int getId(){
		return id;
	}
	
	public void setId(int id){
		this.id = id;
	}
	
	int sid;
	int cid;
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
	
	public Cselect(){
	
	}
	
}
