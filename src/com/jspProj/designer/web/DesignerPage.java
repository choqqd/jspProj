package com.jspProj.designer.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.common.DbCommand;

public class DesignerPage implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		return "desiner/desinerPage.tiles";
	}

}
