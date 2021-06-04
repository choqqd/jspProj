package com.jspProj.order.serviceImpl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.jspProj.common.DAO;
import com.jspProj.order.service.OrderService;
import com.jspProj.order.vo.OrderVO;

public class OrderServiceImpl extends DAO implements OrderService {

	PreparedStatement psmt;
	ResultSet rs;
	String sql = "";

	@Override
	public List<OrderVO> orderSelectList() {
		return null;
	}

	@Override
	public OrderVO selectOrder(OrderVO vo) {
		
		return null;
	}

	@Override
	public int insertOrder(OrderVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateOrder(OrderVO vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteOrder(OrderVO vo) {
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
