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
public class StudentRegister extends BaseAction {

	@Autowired
	ManagerService managerService;
	@Autowired
	LoginService loginService;

	private File upload;  
    private String uploadFileName;  
    private String uploadContentType;  
    private String name;  
    public String execute()throws Exception{  
        String path = ServletActionContext.getServletContext().getRealPath("/WEB-INF/upload");  
        String filename = path+File.separator+uploadFileName;  
        System.out.println("filename"+filename);
        InputStreamReader read = new InputStreamReader(
                new FileInputStream(upload),"UTF-8");//考虑到编码格式
                BufferedReader bufferedReader = new BufferedReader(read);
                String lineTxt = null;
                try{
                while((lineTxt = bufferedReader.readLine()) != null){
                    String arr[] = lineTxt.split(" ");
                    String num=arr[0];
                    String username=arr[1];
                    String password=arr[2];
                    Student stu = new Student();
                    stu.setNum(num);
            		stu.setPassword(password);
            		stu.setUsername(username);
            		managerService.regStu(stu);
                	}
                }catch(Exception e){
                	e.printStackTrace();
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
  
    public File getUpload() {  
        return upload;  
    }  
  
    public void setUpload(File upload) {  
        this.upload = upload;  
    }  
  
    public String getUploadFileName() {  
        return uploadFileName;  
    }  
  
    public void setUploadFileName(String uploadFileName) {  
        this.uploadFileName = uploadFileName;  
    }  
  
    public String getUploadContentType() {  
        return uploadContentType;  
    }  
  
    public void setUploadContentType(String uploadContentType) {  
        this.uploadContentType = uploadContentType;  
    }  
  
    public String getName() {  
        return name;  
    }  
  
    public void setName(String name) {  
        this.name = name;  
    }  
	    
	
}
