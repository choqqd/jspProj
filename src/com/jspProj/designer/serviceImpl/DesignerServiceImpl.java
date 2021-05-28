package com.jspProj.designer.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.jspProj.common.DAO;
import com.jspProj.designer.service.DesignerService;
import com.jspProj.designer.vo.DesignerVO;

public class DesignerServiceImpl extends DAO implements DesignerService{
	PreparedStatement psmt;
	ResultSet rs;
	String sql ="";
	
	@Override
	public List<DesignerVO> DesignerSelectList() {
		sql = "select * from designer";
		List<DesignerVO> list = new ArrayList<>();
		
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				DesignerVO vo = new DesignerVO();
				vo.setDsCode(rs.getInt("ds_code"));
				vo.setDsImage(rs.getString("ds_image"));
				vo.setDsLikeIt(rs.getInt("like_It"));
				vo.setDsName(rs.getString("ds_name"));
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
	public DesignerVO DesignerSelect(DesignerVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertDesigner(DesignerVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateDesigner(DesignerVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteDesigner(DesignerVO vo) {
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
