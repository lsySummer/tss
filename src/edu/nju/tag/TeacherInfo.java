package edu.nju.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import edu.nju.model.Teacher;

public class TeacherInfo  extends SimpleTagSupport{
	public void doTag() throws JspException, IOException {

		try{
		List<Teacher> stuList = (List<Teacher>) getJspContext().findAttribute("teaList");
		JspWriter out = getJspContext().getOut();
		for (int i = 0; i < stuList.size(); i++) {
			int id = stuList.get(i).getId();
			String num = stuList.get(i).getNum();
			String username=stuList.get(i).getUsername();
			String pass=stuList.get(i).getPassword();
			out.println("<tr><TD>" + stuList.get(i).getNum() + "</TD>");
			out.println("<TD>" + stuList.get(i).getUsername() + "</TD>");
			out.println("<TD>" + stuList.get(i).getPassword()+ "</TD>");
			out.println("<td> <a data-toggle='modal' data-target='#myModal3' href='' onclick='tmodify("+id+",\""+num+"\",\""+username+"\","+pass+")'>修改</a>/"
					+ "<a data-toggle='modal' data-target='#myModal4'  href='' onclick='settValue("+id+")'>删除</a></td></tr>");
		}
		}catch(Exception e){
			e.printStackTrace();
			throw new JspException(e.getMessage());
		}

	}
}
