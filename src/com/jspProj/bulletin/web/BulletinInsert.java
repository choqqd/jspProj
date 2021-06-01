package com.jspProj.bulletin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.bulletin.service.BulletinService;
import com.jspProj.bulletin.serviceImpl.BulletinServiceImpl;
import com.jspProj.bulletin.vo.BulletinVO;
import com.jspProj.common.DbCommand;

public class BulletinInsert implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String writer = request.getParameter("name");
		String content = request.getParameter("content");
		String dsName = request.getParameter("dsname");
		
		BulletinVO vo = new BulletinVO();
		vo.setWriter(writer);
		vo.setBtContent(content);
		vo.setDsName(dsName);
		
		String path = "";
		BulletinService service = new BulletinServiceImpl();
		int r = service.insertBulletin(vo);
		if(r>0) {
			path = "designerinfoPage.do";
		}else {
			path = "bulletinInsertForm.do";
		}
		return path;
	}

}
