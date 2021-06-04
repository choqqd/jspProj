package com.jspProj.member.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.common.DbCommand;
import com.jspProj.common.Paging;
import com.jspProj.member.serviceImpl.MemberServiceImpl;
import com.jspProj.member.vo.MemberVO;

public class AdminMemberListPage implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String page = request.getParameter("page"); //사용자가 보고싶은 페이지 번화
		if(page == null)
			page ="1";
		int pageCnt = Integer.parseInt(page);
		
		// 멤버 리스트
		MemberServiceImpl service = new MemberServiceImpl();
		List<MemberVO> list = service.selectMemberList();
		
		// 페이징
		service = new MemberServiceImpl();
		List<MemberVO>total = service.noticeListPaging(pageCnt);
		
		Paging paging = new Paging();
        paging.setPageNo(pageCnt);
        paging.setPageSize(10);
        paging.setTotalCount(total.size());
		
		request.setAttribute("memberList", list);
		request.setAttribute("paging", paging);
		
		return "member/adminMemberListPage.tiles";
	}

}
