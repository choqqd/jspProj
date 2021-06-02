package com.jspProj.common;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.bulletin.web.BulletinDelete;
import com.jspProj.bulletin.web.BulletinInsert;
import com.jspProj.bulletin.web.BulletinInsertForm;
import com.jspProj.bulletin.web.BulletinUpdate;
import com.jspProj.bulletin.web.BulletinUpdateFrom;
import com.jspProj.bulletin.web.BulletinView;
import com.jspProj.bulletin.web.InfoPage;
import com.jspProj.designer.web.DesignerPage;
import com.jspProj.designer.web.DesignerinfoPage;
import com.jspProj.interior.web.InteriorList;
import com.jspProj.interior.web.InteriorSelect;
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
		
		map.put("/info.do", new InfoPage());
		
	//디자이너 탭
		map.put("/designerPage.do", new DesignerPage());
		map.put("/designerinfoPage.do", new DesignerinfoPage());
		map.put("/bulletinView.do", new BulletinView()); //후기게시판 상세보기
		map.put("/bulletinInsertForm.do", new BulletinInsertForm()); //후기작성Form
		map.put("/bulletinInsert.do", new BulletinInsert());//후기작성
		map.put("/bulletinDelete.do", new BulletinDelete()); //후기 삭제
		map.put("/bulletinUpdateForm.do", new BulletinUpdateFrom()); //수정Form
		map.put("/bulletinUpdate.do", new BulletinUpdate()); //업데이트
		
		
	// 인테리어 탭
		map.put("/interiorList.do", new InteriorList());
		map.put("/interiorSelect.do", new InteriorSelect());
		// 인테리어 탭	 --> 장바구니로 넘어가기
		map.put("", null);

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
