
package com.yedam.order.mapper;

import java.util.List;

import com.yedam.common.Pagination;
import com.yedam.order.vo.OrderVO;


import com.yedam.order.vo.OrderVO;

public interface OrderMapper { 
	public OrderVO getOrder(String productCode);
	public int insertOrder(OrderVO ovo);
	public List<OrderVO> getOrderList();
	public int insertPayment(OrderVO ovo);
	public int insertOrderProduct(OrderVO opList);
	public List<OrderVO> selectSearchOrder(OrderVO ovo);
	public List<OrderVO> myOrder(String memId);
	public OrderVO selectBeforeAddr(String memId);
	public int updateOrderStatus(OrderVO ovo);
	public int insertOrderStatus(String ordStatus);
	public OrderVO selectRefundInfo(OrderVO ovo);
	public List<OrderVO> selectOrderListPage(OrderVO ovo);
	public List<OrderVO> selectMyOrderPage(OrderVO ovo);
}