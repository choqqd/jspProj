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
	

	public List<BulletinVO> mainBulletin() {
		sql = "select * from bulletin";
		List<BulletinVO> list = new ArrayList<>();
		BulletinVO vo = null;
		try {
			psmt = conn.prepareStatement(sql);
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
		sql = "select * from bulletin where bt_code=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getBtCode());
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setBtCode(rs.getInt("bt_code"));
				vo.setBtContent(rs.getString("bt_content"));
				vo.setBtFileName(rs.getString("bt_fileName"));
				vo.setDsName(rs.getString("ds_name"));
				vo.setWriter(rs.getString("writer"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}

	@Override
	public int insertBulletin(BulletinVO vo) {
		sql = "insert into bulletin(BT_CODE,BT_CONTENT,ds_name,writer) VALUES(bulletin_seq.nextval,?,?,?)";
		int r = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getBtContent());
			psmt.setString(2, vo.getDsName());
			psmt.setString(3, vo.getWriter());
			
			r = psmt.executeUpdate();
			if(r>0) 
				System.out.println("성공");
			else
				System.out.println("실패");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return r;
	}

	@Override
	public int updateBulletin(BulletinVO vo) {
		sql = "update bulletin set ds_name = ?, bt_content = ?, writer = ? where bt_code = ?";
		int r = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getDsName());
			psmt.setString(2, vo.getBtContent());
			psmt.setString(3, vo.getWriter());
			psmt.setInt(4, vo.getBtCode());
			
			r = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return r;
	}

	@Override
	public int deleteBulletin(BulletinVO vo) {
		sql = "delete from bulletin where bt_Code = ?";
		int r = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getBtCode());
			
			r = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return r;
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
