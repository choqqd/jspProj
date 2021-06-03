package com.jspProj.designer.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.common.DbCommand;
import com.jspProj.designer.service.DesignerService;
import com.jspProj.designer.serviceImpl.DesignerServiceImpl;
import com.jspProj.designer.vo.DesignerVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class DesignerInsert implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		
		int size = 10 * 1024 * 1024;
		String path = "c:/tmp";
		
		ServletContext sc = request.getServletContext();
		path = sc.getRealPath("designer");
		
		String fileName="";
		
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
		
		String dsname = multi.getParameter("designerName");
		String dsinfo = multi.getParameter("designerinfo");
		
		DesignerVO vo = new DesignerVO();
		vo.setDsName(dsname);
		vo.setDsInfo(dsinfo);
		vo.setDsImage(fileName);
		
		DesignerService service = new DesignerServiceImpl();
		int r = service.insertDesigner(vo);
		String page="";
		if(r>0) {
			page = "designerPage.do";
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
