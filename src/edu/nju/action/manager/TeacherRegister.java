package edu.nju.action.manager;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.service.LoginService;
import edu.nju.service.ManagerService;

@Controller
public class TeacherRegister extends BaseAction{
	@Autowired
	ManagerService managerService;
	@Autowired
	LoginService loginService;

	private File tupload;  
    private String tuploadFileName;  
    private String tuploadContentType;  
    public String execute()throws Exception{  
        String path = ServletActionContext.getServletContext().getRealPath("/WEB-INF/tupload");  
        String filename = path+File.separator+tuploadFileName;  
        System.out.println("filename"+filename);
        InputStreamReader read = new InputStreamReader(
                new FileInputStream(tupload),"UTF-8");//考虑到编码格式
                BufferedReader bufferedReader = new BufferedReader(read);
                String lineTxt = null;
                try{
                while((lineTxt = bufferedReader.readLine()) != null){
                    String arr[] = lineTxt.split(" ");
                    String num=arr[0];
                    String username=arr[1];
                    String password=arr[2];
                    Teacher stu = new Teacher();
                    stu.setNum(num);
            		stu.setPassword(password);
            		stu.setUsername(username);
            		managerService.regTch(stu);
                	}
                }catch(Exception e){
                	request.setAttribute("addMessage", "添加失败！");
                	return "fail";
                }
            	List<Student> stu = loginService.getStudent();
        		request.setAttribute("stuList", stu);
        		List<Teacher> tea = loginService.getTeacher();
        		request.setAttribute("teaList", tea);
        		request.setAttribute("addMessage", "添加成功！");
        return SUCCESS;  
    }
	public File getTupload() {
		return tupload;
	}
	public void setTupload(File tupload) {
		this.tupload = tupload;
	}
	public String getTuploadFileName() {
		return tuploadFileName;
	}
	public void setTuploadFileName(String tuploadFileName) {
		this.tuploadFileName = tuploadFileName;
	}
	public String getTuploadContentType() {
		return tuploadContentType;
	}
	public void setTuploadContentType(String tuploadContentType) {
		this.tuploadContentType = tuploadContentType;
	}  
  
  
	
}
