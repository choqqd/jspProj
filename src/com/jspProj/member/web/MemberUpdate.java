package com.jspProj.member.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspProj.common.DbCommand;
import com.jspProj.member.service.MemberService;
import com.jspProj.member.serviceImpl.MemberServiceImpl;
import com.jspProj.member.vo.MemberVO;

public class MemberUpdate implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		String path = "";
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String name = request.getParameter("name");
		String mail = request.getParameter("mail");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String req = request.getParameter("req");
		int n = 0;
		MemberService service = new MemberServiceImpl();
		MemberVO vo = new MemberVO();

		if (request.getMethod().equals("POST")) {
			vo.setMemberId(id);
			vo.setMemberAddr(addr);
			vo.setMemberMail(mail);
			vo.setMemberName(name);
			vo.setMemberPwd(pwd);
			vo.setMemberReq(req);
			vo.setMemberTel(tel);
			n = service.updateMember(vo);
			if (n != 0) {
				path = "/memberInfo.do";
				session.setAttribute("id", vo.getMemberId());
				session.setAttribute("name", vo.getMemberName());
			} else {
				path = "/index.do";
			}
		} else { // GET일때 delete
			vo.setMemberId(id);
			n = service.deleteMember(vo);
			if (n != 0) {
				path = "/memberLogin.do";
				System.out.println("삭제 완료");
				session.invalidate();
			} else {
				path = "/index.do";
			}
		}

		return path;
	}

}
