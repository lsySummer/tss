package edu.nju.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import edu.nju.model.Student;
import edu.nju.model.Teacher;

public class UserinfoHandler extends SimpleTagSupport {
	public void doTag() throws JspException, IOException {

		try{
		List<Student> stuList = (List<Student>) getJspContext().findAttribute("stuList");
		System.out.println(stuList.size());
		JspWriter out = getJspContext().getOut();
		for (int i = 0; i < stuList.size(); i++) {
			int id = stuList.get(i).getId();
			String num = stuList.get(i).getNum();
			String username=stuList.get(i).getUsername();
			System.out.println("username"+username);
			String pass=stuList.get(i).getPassword();
			out.println("<tr><TD>" + stuList.get(i).getNum() + "</TD>");
			out.println("<TD>" + stuList.get(i).getUsername() + "</TD>");
			out.println("<TD>" + stuList.get(i).getPassword()+ "</TD>");
			//"+num+","+name+","+pass+"
			out.println("<td> <a data-toggle='modal' data-target='#myModal' href='' onclick='modify("+id+","+num+",\""+username+"\","+pass+")'>修改</a>/"
					+ "<a data-toggle='modal' data-target='#myModal2'  href='' onclick='setValue("+id+")'>删除</a></td></tr>");
		}
		}catch(Exception e){
			e.printStackTrace();
			throw new JspException(e.getMessage());
		}

	}
}
