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
	// 관리자 업데이트 위한 이미지 들고오기
	public InteriorVO selectImage(int item) {
		sql = "select item_image from item where item_Code = ?";
		InteriorVO vo = null;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, item);
			rs = psmt.executeQuery();
			if(rs.next()){
				vo = new InteriorVO();
				vo.setItemImage(rs.getString("item_image"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return vo;
	}
	
	// Insert 장바구니
	public void addCart(String id, String itemCode, int amount) {
		sql = "insert into cart values(?, ?, ?)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, itemCode);
			psmt.setInt(3, amount);
			int n = psmt.executeUpdate();
			System.out.println(n + " 건 장바구니로 들어감");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	// 장바구니 삭제
	public int deleteCart(String id, String itemCode) {
		sql = "delete from cart where member_id = ? and item_code = ?";
		int n = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, itemCode);
			System.out.println(id + itemCode);
			n = psmt.executeUpdate();
			System.out.println(n + " 건 선택삭제 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
	}

	// 장바구니 전체 삭제
	public int deleteAllCart(String id) {
		sql = "delete from cart where member_id = ?";
		int n = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			n = psmt.executeUpdate();
			System.out.println(id);
			System.out.println("전체삭제 완료");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	// 장바구니 리스트
	public List<InteriorVO> cartList(String id) {
		sql = "select * from (select member_id, item_code, sum(amount) qty from cart group by member_id, item_code) cart, item p where cart.item_code = p.item_code and cart.member_id = ?";
		List<InteriorVO> list = new ArrayList<InteriorVO>();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			while (rs.next()) {
				InteriorVO vo = new InteriorVO();
				vo.setItemCode(rs.getInt("item_code"));
				vo.setItemName(rs.getString("item_name"));
				vo.setItemDesc(rs.getString("item_desc"));
				vo.setAmount(rs.getInt("qty"));
				vo.setDsName(rs.getString("ds_name"));
				vo.setItemImage(rs.getString("item_image"));
				vo.setMemberId(rs.getString("member_id"));
				vo.setPrice(rs.getInt("price"));
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
	public List<InteriorVO> interiorList() {
		sql = "select * from item";
		List<InteriorVO> list = new ArrayList<InteriorVO>();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			while (rs.next()) {
				InteriorVO vo = new InteriorVO();
				vo.setItemCode(rs.getInt("item_code"));
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
			psmt.setInt(1, vo.getItemCode());
			psmt.setString(2, vo.getDsName());
			rs = psmt.executeQuery();
			if (rs.next()) {
				vo.setItemCode(rs.getInt("item_code"));
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
		sql = "insert into item values(itemcode_seq.nextval ,?,?,?,?,?)";
		int n = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getItemName());
			psmt.setInt(2, vo.getPrice());
			psmt.setString(3, vo.getDsName());
			psmt.setString(4, vo.getItemDesc());
			psmt.setString(5, vo.getItemImage());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return n;
	}

	@Override
	public int updateInterior(InteriorVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteInterior(InteriorVO vo) {
		sql = "delete from item where item_code = ?";
		int n = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, vo.getItemCode());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return n;
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
