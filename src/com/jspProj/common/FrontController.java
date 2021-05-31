package com.jspProj.common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.designer.web.DesignerPage;
import com.jspProj.designer.web.DesignerinfoPage;
import com.jspProj.interior.web.InteriorList;
import com.jspProj.member.web.MemberInfo;
import com.jspProj.member.web.MemberJoin;
import com.jspProj.member.web.MemberJoinForm;
import com.jspProj.member.web.MemberLogOut;
import com.jspProj.member.web.MemberLogin;
import com.jspProj.member.web.MemberLoginForm;
import com.jspProj.member.web.MemberUpdate;


public class FrontController extends HttpServlet {
	private HashMap<String, DbCommand> map = new HashMap<>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
	//요청 페이지 - > 실행컨트롤러
		map.put("/index.do", new indexPage());
		map.put("/memberLogin.do", new MemberLogin());
		map.put("/memberLoginForm.do", new MemberLoginForm());
		map.put("/memberJoinForm.do", new MemberJoinForm());
		map.put("/memberJoin.do", new MemberJoin());
		map.put("/memberLogOut.do", new MemberLogOut());
		map.put("/memberInfo.do", new MemberInfo());
		map.put("/memberUpdate.do", new MemberUpdate());
		
	//디자이너 탭
		map.put("/designerPage.do", new DesignerPage());
		map.put("/designerinfoPage.do", new DesignerinfoPage());
		
	// 인테리어 탭
		map.put("/interiorList.do", new InteriorList());
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String uri = req.getRequestURI();
		String cpath = req.getContextPath();
		String path = uri.substring(cpath.length());
		DbCommand command = map.get(path);
		String viewPage = command.execute(req, resp);

		RequestDispatcher rd = req.getRequestDispatcher(viewPage);
		rd.forward(req, resp);
	}
	
}
