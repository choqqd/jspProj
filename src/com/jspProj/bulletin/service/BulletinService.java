package com.jspProj.bulletin.service;

import java.util.List;

import com.jspProj.bulletin.vo.BulletinVO;

public interface BulletinService {
	List<BulletinVO> bulletinSelectList(String name);
	BulletinVO bulletinSelect(BulletinVO vo);
	public int insertBulletin(BulletinVO vo);
	public int updateBulletin(BulletinVO vo);
	public int deleteBulletin(BulletinVO vo);
}
