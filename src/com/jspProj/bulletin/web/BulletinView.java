package com.jspProj.bulletin.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.bulletin.service.BulletinService;
import com.jspProj.bulletin.serviceImpl.BulletinServiceImpl;
import com.jspProj.bulletin.vo.BulletinVO;
import com.jspProj.common.DbCommand;

public class BulletinView implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String btCod = request.getParameter("btCode");
		BulletinVO vo = new BulletinVO();
		
		vo.setBtCode(Integer.parseInt(btCod));
		BulletinService service = new BulletinServiceImpl();
		BulletinVO bvo = service.bulletinSelect(vo);
		
		request.setAttribute("bvo", bvo);
		return "bulletin/bulletinView.tiles";
	}

}
