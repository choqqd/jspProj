package com.jspProj.order.service;

import java.util.List;

import com.jspProj.order.vo.OrderVO;

public interface OrderService {
	List<OrderVO> orderSelectList();
	OrderVO selectOrder(OrderVO vo);
	public int insertOrder(OrderVO vo);
	public int updateOrder(OrderVO vo);
	public int deleteOrder(OrderVO vo);
}
