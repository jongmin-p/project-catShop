
package com.yedam.order.service;

import java.util.List;

import com.yedam.common.Pagination;
import com.yedam.order.vo.OrderVO;

public interface OrderService { 
	public List<OrderVO> orderList();
	public OrderVO getOrder(String orderId);
	public int addOrder(OrderVO ovo);
	public int addPayment(OrderVO ovo);
	public int addOrderProduct(OrderVO opList);
	public List<OrderVO> searchOrder(OrderVO ovo);
	public List<OrderVO> myOrder(String memId);
	public OrderVO getBeforeAddr(String memId);
	public int modifyOrderStatus(OrderVO ovo);
	public int addOrdStatus(String ordStatus);
	public OrderVO getRefundInfo(OrderVO ovo);
	public List<OrderVO> orderListPage(OrderVO ovo);
	public List<OrderVO> myOrderPage(OrderVO ovo);
}