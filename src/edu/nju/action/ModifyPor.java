package edu.nju.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.model.Student;
import edu.nju.model.Teacher;
import edu.nju.service.LoginService;

@Controller
public class ModifyPor extends BaseAction {

	@Autowired
	private LoginService loginService;

	private File file;   
	private String fileFileName;
    public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileFileContentType() {
		return fileFileContentType;
	}

	public void setFileFileContentType(String fileFileContentType) {
		this.fileFileContentType = fileFileContentType;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	private String fileFileContentType;
    private String message = "0"; // 0格式错误 1成功(文件路径)  2失败
    private String filePath;

	@SuppressWarnings("deprecation")
	@Override
	public String execute() {
		Teacher t = (Teacher)session.get("tuser");
		System.out.println("fileName "+fileFileName);
        String path = ServletActionContext.getRequest().getRealPath("/portrait");
        File file = new File(path); // 判断文件夹是否存在,如果不存在则创建文件夹
        if (!file.exists()) {
            file.mkdir();
        }
        String[] fileSuffix = new String[] { ".exe" };// 禁止文件
        try {
            File f = this.getFile();
            // 判断文件格式
            for (int i = 0; i < fileSuffix.length; i++) {
                if (fileFileName.endsWith(fileSuffix[i])) {
                    message = "0";
                    return ERROR;
                }
            }
            String fileName[]=fileFileName.split("\\.");
            fileFileName = t.getUsername()+"."+fileName[1];
            t = loginService.insertPor(t.getId(),fileFileName);
            session.put("tuser", t);
            FileInputStream inputStream = new FileInputStream(f);
            FileOutputStream outputStream = new FileOutputStream(path + "\\"
                    + fileFileName);
            byte[] buf = new byte[1024];
            int length = 0;
            while ((length = inputStream.read(buf)) != -1) {
                outputStream.write(buf, 0, length);
            }
            inputStream.close();
            outputStream.flush();
            message = path + "\\" + this.getFileFileName();
        } catch (Exception e) {
            e.printStackTrace();
            message = "2";
        }
        return SUCCESS;
	}
	
	public String sMod(){
		Student t = (Student)session.get("suser");
        String path = ServletActionContext.getRequest().getRealPath("/portrait");
        File file = new File(path); // 判断文件夹是否存在,如果不存在则创建文件夹
        if (!file.exists()) {
            file.mkdir();
        }
        String[] fileSuffix = new String[] { ".exe" };// 禁止文件
        try {
            File f = this.getFile();
            // 判断文件格式
            for (int i = 0; i < fileSuffix.length; i++) {
                if (fileFileName.endsWith(fileSuffix[i])) {
                    message = "0";
                    return ERROR;
                }
            }
            String fileName[]=fileFileName.split("\\.");
            fileFileName = t.getUsername()+"."+fileName[1];
            Student s = loginService.sinsertPor(t.getId(),fileFileName);
            session.put("suser", s);
            FileInputStream inputStream = new FileInputStream(f);
            FileOutputStream outputStream = new FileOutputStream(path + "\\"
                    + fileFileName);
            byte[] buf = new byte[1024];
            int length = 0;
            while ((length = inputStream.read(buf)) != -1) {
                outputStream.write(buf, 0, length);
            }
            inputStream.close();
            outputStream.flush();
            message = path + "\\" + this.getFileFileName();
        } catch (Exception e) {
            e.printStackTrace();
            message = "2";
        }
        return SUCCESS;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public void savePortrait(){
		
	}
	
}
