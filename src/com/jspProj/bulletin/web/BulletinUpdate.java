package com.jspProj.bulletin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.bulletin.service.BulletinService;
import com.jspProj.bulletin.serviceImpl.BulletinServiceImpl;
import com.jspProj.bulletin.vo.BulletinVO;
import com.jspProj.common.DbCommand;

public class BulletinUpdate implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String btcode = request.getParameter("btcode");
		String dsname = request.getParameter("dsname");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
		BulletinService service = new BulletinServiceImpl();
		BulletinVO vo = new BulletinVO();
		vo.setBtCode(Integer.parseInt(btcode));
		vo.setDsName(dsname);
		vo.setBtContent(content);
		vo.setWriter(writer);
		System.out.println(writer);
		String path = "";
		int r = service.updateBulletin(vo);
		if(r>0)
			path = "designerPage.do";
		else
			path = "bulletinUpdateForm.do";
		return path;
	}

}
