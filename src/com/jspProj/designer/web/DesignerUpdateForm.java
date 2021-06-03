package com.jspProj.designer.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.common.DbCommand;

public class DesignerUpdateForm implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String dsCode = request.getParameter("dsCode");
		
		request.setAttribute("dsCode", dsCode);
		return "designer/designerUpdatForm.tiles";
	}

}
