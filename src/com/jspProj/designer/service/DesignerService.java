package com.jspProj.designer.service;

import java.util.List;

import com.jspProj.designer.vo.DesignerVO;


public interface DesignerService {
	List<DesignerVO> DesignerSelectList();
	DesignerVO DesignerSelect(DesignerVO vo);
	public int insertDesigner(DesignerVO vo);
	public int updateDesigner(DesignerVO vo);
	public int deleteDesigner(DesignerVO vo);
}
