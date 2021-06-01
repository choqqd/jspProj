package com.jspProj.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.jspProj.common.DbCommand;
import com.jspProj.member.serviceImpl.MemberServiceImpl;
import com.jspProj.member.vo.MemberVO;

public class MemberLoginForm implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 로그인 버튼 누름 -> 로그인 성공 , 로그인 실패 -> memberLoginSuccess, memberLoginFail
		HttpSession session = request.getSession();

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		System.out.println(id + pwd);
		MemberVO vo = new MemberVO();
		vo.setMemberId(id);
		vo.setMemberPwd(pwd);

		MemberServiceImpl service = new MemberServiceImpl();
		MemberVO result = service.checkMember(vo);

		String path = "";

		if (result == null) {
			path = "member/LoginFail.tiles";
		} else {
			session.setAttribute("id", result.getMemberId());
			session.setAttribute("name", result.getMemberName());
			path = "index.do";

		}
		return path;
	}
}
