package com.jspProj.interior.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jspProj.common.DAO;
import com.jspProj.interior.service.InteriorService;
import com.jspProj.interior.vo.InteriorVO;

public class InteriorServiceImpl extends DAO implements InteriorService {

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
			while (rs.next()) {
				InteriorVO vo = new InteriorVO();
				vo.setItemCode(rs.getString("item_code"));
				vo.setItemName(rs.getString("item_name"));
				vo.setPrice(rs.getInt("price"));
				vo.setDsName(rs.getString("ds_name"));
				vo.setItemDesc(rs.getString("item_desc"));
				vo.setItemImage(rs.getString("item_image"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}

	@Override
	public InteriorVO selectInterior(InteriorVO vo) {
		sql = "select D.ds_image, i.* from item i, DESIGNER D where i.item_code = ? and D.ds_name= ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getItemCode());
			psmt.setString(2, vo.getDsName());
			rs = psmt.executeQuery();
			if (rs.next()) {
				vo.setItemCode(rs.getString("item_code"));
				vo.setItemName(rs.getString("item_name"));
				vo.setItemDesc(rs.getString("item_desc"));
				vo.setItemImage(rs.getString("item_image"));
				vo.setDsName(rs.getString("ds_name"));
				vo.setDsImage(rs.getString("ds_image"));
				vo.setPrice(rs.getInt("price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
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
