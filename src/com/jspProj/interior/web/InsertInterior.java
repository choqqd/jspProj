package com.jspProj.interior.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.common.DbCommand;
import com.jspProj.interior.service.InteriorService;
import com.jspProj.interior.serviceImpl.InteriorServiceImpl;
import com.jspProj.interior.vo.InteriorVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class InsertInterior implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		
		int size = 10 * 1024 * 1024;
		String path = "c:/tmp";
		
		ServletContext sc = request.getServletContext();
		path = sc.getRealPath("upload");

		String fileName ="";
		
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
			Enumeration files = multi.getFileNames();
			while(files.hasMoreElements()) {
				String itemImage = (String) files.nextElement();
				fileName = multi.getFilesystemName(itemImage);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String itemName = multi.getParameter("itemName");
		String price = multi.getParameter("price");
		String dsname = multi.getParameter("dsname");
		String itemdesc = multi.getParameter("itemdesc");

		InteriorVO vo = new InteriorVO();
		vo.setItemName(itemName);
		vo.setPrice(Integer.parseInt(price));
		vo.setDsName(dsname);
		vo.setItemDesc(itemdesc);
		vo.setItemImage(fileName);
		InteriorService service = new InteriorServiceImpl();
		int r = service.insertInterior(vo);
		String page="";
		
		if(r>0) {
			page="/interiorList.do";
		}else {
			PrintWriter script;
			try {
				script = response.getWriter();
				script.println("<script>");
				script.println("window.alert('등록에 실패했습니다.')");
				script.println("history.go(-1)");
				script.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return page;
	}

}
