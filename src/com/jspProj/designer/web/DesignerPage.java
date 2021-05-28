package com.jspProj.designer.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.common.DbCommand;
import com.jspProj.designer.service.DesignerService;
import com.jspProj.designer.serviceImpl.DesignerServiceImpl;
import com.jspProj.designer.vo.DesignerVO;

public class DesignerPage implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		DesignerService service = new DesignerServiceImpl();
		List<DesignerVO> list = service.DesignerSelectList();
		
		request.setAttribute("list", list);
		
		return "desiner/desinerPage.tiles";
	}

}
