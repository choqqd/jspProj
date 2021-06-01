package com.jspProj.bulletin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.bulletin.service.BulletinService;
import com.jspProj.bulletin.serviceImpl.BulletinServiceImpl;
import com.jspProj.bulletin.vo.BulletinVO;
import com.jspProj.common.DbCommand;

public class BulletinDelete implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String btcode = request.getParameter("btcode");
		
		BulletinVO vo = new BulletinVO();
		vo.setBtCode(Integer.parseInt(btcode));
		
		BulletinService service = new BulletinServiceImpl();
		int r = service.deleteBulletin(vo);
		String path = "";
		
		if(r>0) 
			path = "designerPage.do";
		else
			path = "bulletinView.do";
		return path;
	}

}
