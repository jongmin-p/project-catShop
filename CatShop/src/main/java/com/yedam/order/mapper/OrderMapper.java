
package com.yedam.order.mapper;

import java.util.List;

import com.yedam.common.Pagination;
import com.yedam.order.vo.OrderVO;


import com.yedam.order.vo.OrderVO;

public interface OrderMapper { 
	public OrderVO getOrder(String productCode);// 단건조회.
	
	public int insertOrder(OrderVO ovo); // 주문정보 추가

	public List<OrderVO> getOrderList(); // 주문정보 전체 조회

	public int insertPayment(OrderVO ovo); //지불정보 추가

	public int insertOrderProduct(OrderVO opList); //주문 상품 정보

	public List<OrderVO> selectSearchOrder(OrderVO ovo); //주문정보 검색

	public List<OrderVO> myOrder(String memId); //mypage 주문내역

	public OrderVO selectBeforeAddr(String memId); // 이전 배송 주소 조회

	public int updateOrderStatus(OrderVO ovo); // 배송 상태 수정 

	public int insertOrderStatus(String ordStatus); //order status 입력

	public OrderVO selectRefundInfo(OrderVO ovo); //환불 정보 조회

	public List<OrderVO> selectOrderListPage(OrderVO ovo);

	public List<OrderVO> selectMyOrderPage(OrderVO ovo);

}
