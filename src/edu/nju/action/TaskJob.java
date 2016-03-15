package edu.nju.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.Calendar;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.nju.model.Chowok;
import edu.nju.model.Course;
import edu.nju.service.LoginService;

@Service
public class TaskJob extends BaseAction{
	@Autowired
	LoginService loginService;
	public void job1() {
		System.out.println("任务进行中。。。");
		List<Course> cList = loginService.getCourse();
		String todayStr=todayDate();
		for(int i=0;i<cList.size();i++){
			Course c = cList.get(i);
			if(c.getEndDate().compareTo(todayStr)==0){
				int cid = c.getId();
				List<Chowok> chList = loginService.getChowokList(cid);
				String excelPath="E:/"+c.getCname()+"."+"xls";
				System.out.println(fileExist(excelPath));
				String title[] = { "hid", "sddl", "addl","format","score","dif","info", "comment"};
				createExcel(excelPath, "sheet1", title);
				System.out.println(sheetExist(excelPath, "sheet1"));
				for(int j=0;j<chList.size();j++){
					Chowok ch = chList.get(j);
					writeToExcel(excelPath,"sheet1",ch);
				}
			}
		}
	}

	private HSSFWorkbook workbook = null;
	
	public String todayDate(){
		Calendar cal=Calendar.getInstance();    
		int y=cal.get(Calendar.YEAR);    
		int m=cal.get(Calendar.MONTH)+1;    
		int d=cal.get(Calendar.DATE); 
		String year=y+"";
		String month=m+"";
		String date=d+"";
		if(m<10){
			month="0"+m;
		}
		if(d<10){
			date="0"+date;
		}
		String todayStr=year+" "+month+" "+date;
		return todayStr;
	}

	/**
	 * 判断文件是否存在.
	 * 
	 * @param fileDir
	 *            文件路径
	 * @return
	 */
	public boolean fileExist(String fileDir) {
		boolean flag = false;
		File file = new File(fileDir);
		flag = file.exists();
		return flag;
	}

	/**
	 * 判断文件的sheet是否存在.
	 * 
	 * @param fileDir
	 *            文件路径
	 * @param sheetName
	 *            表格索引名
	 * @return
	 */
	public boolean sheetExist(String fileDir, String sheetName) {
		boolean flag = false;
		File file = new File(fileDir);
		if (file.exists()) { // 文件存在
			// 创建workbook
			try {
				workbook = new HSSFWorkbook(new FileInputStream(file));
				// 添加Worksheet（不添加sheet时生成的xls文件打开时会报错)
				HSSFSheet sheet = workbook.getSheet(sheetName);
				if (sheet != null)
					flag = true;
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else { // 文件不存在
			flag = false;
		}

		return flag;
	}

	/**
	 * 创建新excel.
	 * 
	 * @param fileDir
	 *            excel的路径
	 * @param sheetName
	 *            要创建的表格索引
	 * @param titleRow
	 *            excel的第一行即表格头
	 */
	public void createExcel(String fileDir, String sheetName, String titleRow[]) {
		// 创建workbook
		workbook = new HSSFWorkbook();
		// 添加Worksheet（不添加sheet时生成的xls文件打开时会报错)
		Sheet sheet1 = workbook.createSheet(sheetName);
		// 新建文件
		FileOutputStream out = null;
		try {
			// 添加表头
			Row row = workbook.getSheet(sheetName).createRow(0); // 创建第一行
			for (int i = 0; i < titleRow.length; i++) {
				Cell cell = row.createCell(i);
				cell.setCellValue(titleRow[i]);
			}

			out = new FileOutputStream(fileDir);
			workbook.write(out);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	/**
	 * 往excel中写入(已存在的数据无法写入).
	 * 
	 * @param fileDir
	 *            文件路径
	 * @param sheetName
	 *            表格索引
	 * @param object
	 */
	public void writeToExcel(String fileDir, String sheetName, Object object) {
		// 创建workbook
		File file = new File(fileDir);
		try {
			workbook = new HSSFWorkbook(new FileInputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 流
		FileOutputStream out = null;
		HSSFSheet sheet = workbook.getSheet(sheetName);
		// 获取表格的总行数
		int rowCount = sheet.getLastRowNum() + 1; // 需要加一
		// 获取表头的列数
		int columnCount = sheet.getRow(0).getLastCellNum();
		try {
			Row row = sheet.createRow(rowCount); // 最新要添加的一行
			// 通过反射获得object的字段,对应表头插入
			// 获取该对象的class对象
			Class class_ = object.getClass();
			// 获得表头行对象
			HSSFRow titleRow = sheet.getRow(0);
			if (titleRow != null) {
				for (int columnIndex = 0; columnIndex < columnCount; columnIndex++) { // 遍历表头
					String title = titleRow.getCell(columnIndex).toString().trim().toString().trim();
					String UTitle = Character.toUpperCase(title.charAt(0)) + title.substring(1, title.length()); // 使其首字母大写;
					String methodName = "get" + UTitle;
					Method method = class_.getDeclaredMethod(methodName); // 设置要执行的方法
					String data="";
					if(method.invoke(object)==null){
						data="";
					}else{
						data = method.invoke(object).toString(); // 执行该get方法,即要插入的数据
					}
					Cell cell = row.createCell(columnIndex);
					cell.setCellValue(data);
				}
			}

			out = new FileOutputStream(fileDir);
			workbook.write(out);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

}
