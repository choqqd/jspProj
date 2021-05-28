package com.jspProj.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.common.DbCommand;

public class MemberLoginForm implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 로그인 버튼 누름 -> 로그인 성공 , 로그인 실패 -> memberLoginSuccess, memberLoginFail
		
		
		return null;
	}

}
