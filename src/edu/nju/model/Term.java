package edu.nju.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "term")
public class Term {
	@Id
	int id;
	String cterm;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCterm() {
		return cterm;
	}
	public void setCterm(String cterm) {
		this.cterm = cterm;
	}
	
}
