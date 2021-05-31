package com.jspProj.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.common.DbCommand;
import com.jspProj.member.service.MemberService;
import com.jspProj.member.serviceImpl.MemberServiceImpl;
import com.jspProj.member.vo.MemberVO;

public class MemberInfo implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
		MemberService service = new MemberServiceImpl();
		
		MemberVO vo = service.selectMember(id);
		
		request.setAttribute("info", vo);
		
		return "member/memberInfo.tiles";
	}

}
