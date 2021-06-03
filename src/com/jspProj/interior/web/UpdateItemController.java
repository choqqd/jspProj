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

public class UpdateItemController implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("utf-8");
		
		int fileSize = 10 * 1024 * 1024;
		String path = "c:/tmp";
		
		ServletContext sc = request.getServletContext();
		path = sc.getRealPath("upload");
		
		String fileName = "";
		MultipartRequest multi = null;
		try {
			 multi = new MultipartRequest(request, path, fileSize, "utf-8", new DefaultFileRenamePolicy());
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
		String dsName = multi.getParameter("dsname");
		String itemDesc = multi.getParameter("itemdesc");
		String itemCode = multi.getParameter("itemCode");
		
		InteriorVO vo = new InteriorVO();
		vo.setItemName(itemName);
		vo.setPrice(Integer.parseInt(price));
		vo.setDsName(dsName);
		vo.setItemDesc(itemDesc);
		vo.setItemImage(fileName);
		vo.setItemCode(Integer.parseInt(itemCode));
		InteriorService service = new InteriorServiceImpl();
		int n = service.updateInterior(vo);
		
		String url = "";
		
		if(n != 0) {
			url = "/interiorList.do";
		} else {
			PrintWriter script;
			try {
				script = response.getWriter();
				script.print("<script>");
				script.print("window.alert('수정 실패하셨습니다.')");
				script.print("<history.go(-1)>");
				script.print("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return url;
	}

}
