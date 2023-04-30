
package com.yedam.order.service;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import com.yedam.common.DataSource;
import com.yedam.common.Pagination;
import com.yedam.order.mapper.OrderMapper;
import com.yedam.order.vo.OrderVO;
import com.yedam.product.mapper.ProductMapper;
import com.yedam.product.vo.ProductVO;

public class OrderServiceImpl implements OrderService {
	SqlSession session = DataSource.getInstance().openSession(true);
	OrderMapper mapper = session.getMapper(OrderMapper.class);

	@Override
	public List<OrderVO> orderList() {
		return mapper.getOrderList();
	}

	@Override
	public OrderVO getOrder(String orderId) {
		return mapper.getOrder(orderId);
	}
	
	@Override
	public int addOrder(OrderVO ovo) {
		return mapper.insertOrder(ovo);
	}

	@Override
	public int addPayment(OrderVO ovo) {
		return mapper.insertPayment(ovo);
	}

	@Override
	public int addOrderProduct(OrderVO opList) {
		return mapper.insertOrderProduct(opList);
	}

	@Override
	public List<OrderVO> searchOrder(OrderVO ovo) {
		return mapper.selectSearchOrder(ovo);
  } 
  @Override
	public List<OrderVO> myOrder(String memId) { //mypage 주문내역
		return mapper.myOrder(memId);

	}

	@Override
	public OrderVO getBeforeAddr(String memId) {
		return mapper.selectBeforeAddr(memId);
	}

	@Override
	public int modifyOrderStatus(OrderVO ovo) {
		return mapper.updateOrderStatus(ovo);
	}

	@Override
	public int addOrdStatus(String ordStatus) {
		return mapper.insertOrderStatus(ordStatus);
	}
	
	@Override
	public OrderVO getRefundInfo(OrderVO ovo) {
		return mapper.selectRefundInfo(ovo);
	}

	@Override
	public List<OrderVO> orderListPage(OrderVO ovo) {
		return mapper.selectOrderListPage(ovo);
	}

	@Override
	public List<OrderVO> myOrderPage(OrderVO ovo) {
		return mapper.selectMyOrderPage(ovo);
	}
}
