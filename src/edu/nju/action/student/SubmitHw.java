package edu.nju.action.student;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import edu.nju.action.BaseAction;
import edu.nju.model.Course;
import edu.nju.service.StudentService;
@Controller
public class SubmitHw extends BaseAction{
	@Autowired
	StudentService studentService;
	 private File file;
	    private String fileFileName;
	    private String fileFileContentType;
	    private String message = "0"; // 0格式错误 1成功(文件路径)  2失败
	    private String filePath;
	    private String shid;

		public String getShid() {
			return shid;
		}

		public void setShid(String shid) {
			this.shid = shid;
		}

		public String getFilePath() {
	        return filePath;
	    }

	    public void setFilePath(String filePath) {
	        this.filePath = filePath;
	    }

	    public String getMessage() {
	        return message;
	    }

	    public void setMessage(String message) {
	        this.message = message;
	    }

	    public File getFile() {
	        return file;
	    }

	    public void setFile(File file) {
	        this.file = file;
	    }

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

	    @SuppressWarnings("deprecation")
	    @Override
	    public String execute() throws Exception {
	    	Course c = (Course) session.get("course");
			request.setAttribute("course", c);
			int cid = c.getId();
			String username = (String) session.get("username");
			String sid=studentService.getStudent(username).getNum();
	        String path = ServletActionContext.getRequest().getRealPath("/homework");
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
	            fileFileName=cid+"_"+shid+"_"+sid+"."+fileName[1];
	            studentService.addShPath(sid,Integer.parseInt(shid),fileFileName);
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


}
