package com.jspProj.interior.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jspProj.common.DAO;
import com.jspProj.interior.service.InteriorService;
import com.jspProj.interior.vo.InteriorVO;

public class InteriorServiceImpl extends DAO implements InteriorService{

	PreparedStatement psmt;
	ResultSet rs;
	String sql;

	@Override
	public List<InteriorVO> interiorList() {
		sql = "select * from item";
		List<InteriorVO> list = new ArrayList<InteriorVO>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				InteriorVO vo = new InteriorVO();
				vo.setItemCode(rs.getString("item_code"));
				vo.setItemName(rs.getString("item_name"));
				vo.setPrice(rs.getInt("price"));
				vo.setDsName(rs.getString("ds_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return null;
	}

	@Override
	public InteriorVO selectInterior() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertInterior(InteriorVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateInterior(InteriorVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteInterior(InteriorVO vo) {
		// TODO Auto-generated method stub
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
