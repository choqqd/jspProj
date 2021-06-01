package com.jspProj.interior.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspProj.common.DbCommand;
import com.jspProj.interior.service.InteriorService;
import com.jspProj.interior.serviceImpl.InteriorServiceImpl;
import com.jspProj.interior.vo.InteriorVO;

public class InteriorSelect implements DbCommand {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String itemCode = request.getParameter("itemCode");
		String dsName = request.getParameter("dsName");
		InteriorVO vo = new InteriorVO();
		vo.setItemCode(itemCode);
		vo.setDsName(dsName);
		InteriorService service = new InteriorServiceImpl();
		service.selectInterior(vo);

		request.setAttribute("select", vo);
		return "interior/interiorSelect.tiles";
	}

}
