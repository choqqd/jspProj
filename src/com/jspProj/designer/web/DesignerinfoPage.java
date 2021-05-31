package com.jspProj.designer.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.bulletin.service.BulletinService;
import com.jspProj.bulletin.serviceImpl.BulletinServiceImpl;
import com.jspProj.bulletin.vo.BulletinVO;
import com.jspProj.common.DbCommand;
import com.jspProj.designer.service.DesignerService;
import com.jspProj.designer.serviceImpl.DesignerServiceImpl;
import com.jspProj.designer.vo.DesignerVO;

public class DesignerinfoPage implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("DesinerName");
		DesignerVO vo = new DesignerVO();
		vo.setDsName(name);
		DesignerService service = new DesignerServiceImpl();
		DesignerVO rvo = service.DesignerSelect(vo);
		
		BulletinService bservice = new BulletinServiceImpl();
		List<BulletinVO> blist = bservice.bulletinSelectList(name);
		
		
		request.setAttribute("blist", blist);
		request.setAttribute("rvo", rvo);
		
		return "designerPage.do";
	}

}
