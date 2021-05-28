package com.jspProj.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspProj.common.DbCommand;
import com.jspProj.member.service.MemberService;
import com.jspProj.member.serviceImpl.MemberServiceImpl;
import com.jspProj.member.vo.MemberVO;

public class MemberJoin implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String mail = request.getParameter("mail");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String req = request.getParameter("req");
		
		MemberVO vo = new MemberVO();
		vo.setMemberId(id);
		vo.setMemberPwd(pwd);
		vo.setMemberName(name);
		vo.setMemberMail(mail);
		vo.setMemberTel(tel);
		vo.setMemberAddr(addr);
		vo.setMemberReq(req);
		
		MemberService service = new MemberServiceImpl();
		service.insertMember(vo);
		
		request.setAttribute("id", id);
		session.setAttribute("id", id);
		session.setAttribute("member", vo);
		return "/index.do";
	}

}
