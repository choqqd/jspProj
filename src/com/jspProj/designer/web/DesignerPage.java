package com.jspProj.designer.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.bulletin.serviceImpl.BulletinServiceImpl;
import com.jspProj.bulletin.vo.BulletinVO;
import com.jspProj.common.DbCommand;
import com.jspProj.designer.service.DesignerService;
import com.jspProj.designer.serviceImpl.DesignerServiceImpl;
import com.jspProj.designer.vo.DesignerVO;

public class DesignerPage implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		DesignerService service = new DesignerServiceImpl();
		List<DesignerVO> list = service.DesignerSelectList();
		
		BulletinServiceImpl service2 = new BulletinServiceImpl();
		List<BulletinVO> main = service2.mainBulletin();
		request.setAttribute("list", list);
		request.setAttribute("main", main);
		return "designer/designerPage.tiles";
	}

}
