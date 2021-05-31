package com.jspProj.bulletin.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jspProj.bulletin.service.BulletinService;
import com.jspProj.bulletin.vo.BulletinVO;
import com.jspProj.common.DAO;

public class BulletinServiceImpl extends DAO implements BulletinService{
	PreparedStatement psmt;
	ResultSet rs;
	String sql = "";
	
	
	@Override
	public List<BulletinVO> bulletinSelectList(String name) {
		sql = "select * from bulletin where ds_name =?";
		List<BulletinVO> list = new ArrayList<>();
		BulletinVO vo = null;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, name);
			rs = psmt.executeQuery();
			while(rs.next()) {
				vo = new BulletinVO();
				vo.setBtCode(rs.getInt("bt_Code"));
				vo.setBtContent(rs.getString("bt_content"));
				vo.setBtFileName(rs.getString("bt_fileName"));
				vo.setDsName(rs.getString("ds_name"));
				vo.setWriter(rs.getString("writer"));
				list.add(vo);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}

	@Override
	public BulletinVO bulletinSelect(BulletinVO vo) {
		sql = "select * from bulletin where ds_name=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getDsName());
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setBtCode(rs.getInt("bt_Code"));
				vo.setBtContent(rs.getString("bt_content"));
				vo.setBtFileName(rs.getString("bt_fileName"));
				vo.setDsName(rs.getString("ds_name"));
				vo.setWriter(rs.getString("writer"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}

	@Override
	public int insertBulletin(BulletinVO vo) {
		return 0;
	}

	@Override
	public int updateBulletin(BulletinVO vo) {
		return 0;
	}

	@Override
	public int deleteBulletin(BulletinVO vo) {
		return 0;
	}

	public void close() {

		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (psmt != null) {
			try {
				psmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
