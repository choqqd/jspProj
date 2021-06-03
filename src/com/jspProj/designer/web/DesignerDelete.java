package com.jspProj.designer.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.common.DbCommand;
import com.jspProj.designer.service.DesignerService;
import com.jspProj.designer.serviceImpl.DesignerServiceImpl;
import com.jspProj.designer.vo.DesignerVO;

public class DesignerDelete implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String dscode = request.getParameter("dsCode");
		
		DesignerVO vo = new DesignerVO();
		vo.setDsCode(Integer.parseInt(dscode));
		
		DesignerService service = new DesignerServiceImpl();
		int r = service.deleteDesigner(vo);
		String page="";
		
		if(r>0) {
			page = "/designerPage.do";
		}else {
			PrintWriter script;
			try {
				script = response.getWriter();
				script.println("<script>");
				script.println("window.alert('삭제 실패했습니다.')");
				script.println("history.go(-1)");
				script.println("</script>");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		return page;
	}

}
