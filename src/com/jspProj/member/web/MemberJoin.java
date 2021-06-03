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
		String req = request.getParameter("req");

		String addr1 = request.getParameter("sample4_postcode");
		String addr2 = request.getParameter("sample4_roadAddress");
		String addr3 = request.getParameter("sample4_jibunAddress");
		String addr4 = request.getParameter("sample4_detailAddress");
		String addr5 = request.getParameter("sample4_extraAddress");
		
		String addr = "(" + addr1 +")" + addr2 +" " + addr3 + addr4 + addr5;
		
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
		request.setAttribute("name", name);
		session.setAttribute("id", id);
		session.setAttribute("name", name);
		session.setAttribute("member", vo);
		return "/index.do";
	}

}
