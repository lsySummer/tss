package edu.nju.action.student;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import edu.nju.action.BaseAction;

public class CourseDownload extends BaseAction{
	private String cname;

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}
	
	public String download() {
		String rootpath = ServletActionContext.getRequest().getRealPath("/course");
        String path = rootpath+"\\"+cname+".xls";
        commonDownload(path);
        return null;
    }
	
	public void commonDownload(String path){
		  HttpServletResponse response = ServletActionContext.getResponse();
	        try {
	            // path是指欲下载的文件的路径。
	            File file = new File(path);
	            // 取得文件名。
	            String filename = file.getName();
	            // 取得文件的后缀名。
	            String ext = filename.substring(filename.lastIndexOf(".") + 1)
	                    .toUpperCase();

	            // 以流的形式下载文件。
	            InputStream fis = new BufferedInputStream(new FileInputStream(path));
	            byte[] buffer = new byte[fis.available()];
	            fis.read(buffer);
	            fis.close();
	            // 清空response
	            response.reset();
	            // 设置response的Header
	            String filenameString = new String(filename.getBytes("gbk"),
	                    "iso-8859-1");
	            response.addHeader("Content-Disposition", "attachment;filename="
	                    + filenameString);
	            response.addHeader("Content-Length", "" + file.length());
	            OutputStream toClient = new BufferedOutputStream(response
	                    .getOutputStream());
	            response.setContentType("application/octet-stream");
	            toClient.write(buffer);
	            toClient.flush();
	            toClient.close();
	        } catch (IOException ex) {
	            ex.printStackTrace();
	        }
	}

}
