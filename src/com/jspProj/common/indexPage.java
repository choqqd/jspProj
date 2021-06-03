package com.jspProj.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class indexPage implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		return "common/section.tiles";
	}

}
