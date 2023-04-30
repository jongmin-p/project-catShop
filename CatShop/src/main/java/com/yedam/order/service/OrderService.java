
package com.yedam.order.service;

import java.util.List;

import com.yedam.common.Pagination;
import com.yedam.order.vo.OrderVO;

public interface OrderService { 
	public List<OrderVO> orderList(); // 목록

	public OrderVO getOrder(String orderId);

	public int addOrder(OrderVO ovo);	//orders정보 추가

	public int addPayment(OrderVO ovo); //payment정보 추가

	public int addOrderProduct(OrderVO opList); //구매 상품 정보

	public List<OrderVO> searchOrder(OrderVO ovo);

	public List<OrderVO> myOrder(String memId); //mypage주문내역출력

	public OrderVO getBeforeAddr(String memId); //이전 배송 정보 조회

	public int modifyOrderStatus(OrderVO ovo); //배송정보 수정

	public int addOrdStatus(String ordStatus); //ordproduct 테이블 상태 추가

	public OrderVO getRefundInfo(OrderVO ovo);

	public List<OrderVO> orderListPage(OrderVO ovo);

	public List<OrderVO> myOrderPage(OrderVO ovo);

}
