package com.jspProj.bulletin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.common.DbCommand;

public class BulletinUpdateFrom implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String dsname = request.getParameter("dsname");
		String content = request.getParameter("content");
		String btcode = request.getParameter("btcode");
		
		request.setAttribute("dsname",dsname);
		request.setAttribute("content",content);
		request.setAttribute("btcode",btcode);
		return "bulletin/bulletinUpdateForm.tiles";
	}

}
