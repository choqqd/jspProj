package com.jspProj.interior.service;

import java.util.List;

import com.jspProj.interior.vo.InteriorVO;

public interface InteriorService {
	List<InteriorVO> interiorList();

	InteriorVO selectInterior();

	public int insertInterior(InteriorVO vo);

	public int updateInterior(InteriorVO vo);

	public int deleteInterior(InteriorVO vo);
}
