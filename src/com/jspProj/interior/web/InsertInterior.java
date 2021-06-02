package com.jspProj.interior.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.common.DbCommand;
import com.jspProj.interior.service.InteriorService;
import com.jspProj.interior.serviceImpl.InteriorServiceImpl;
import com.jspProj.interior.vo.InteriorVO;

public class InsertInterior implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String itemName = request.getParameter("itemName");
		String price = request.getParameter("price");
		String dsname = request.getParameter("dsname");
		String itemdesc = request.getParameter("itemdesc");
		String filename = request.getParameter("req");

		InteriorVO vo = new InteriorVO();
		vo.setItemName(itemName);
		vo.setPrice(Integer.parseInt(price));
		vo.setDsName(dsname);
		vo.setItemDesc(itemdesc);
		vo.setItemImage(filename);
		InteriorService service = new InteriorServiceImpl();
		service.insertInterior(vo);
		return "/interiorList.do";
	}

}
