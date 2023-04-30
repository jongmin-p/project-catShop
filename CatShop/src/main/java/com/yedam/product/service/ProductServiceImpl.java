package com.yedam.product.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.common.Pagination;
import com.yedam.mypage.vo.ZzimVO;
import com.yedam.product.mapper.ProductMapper;
import com.yedam.product.vo.ProductVO;

public class ProductServiceImpl implements ProductService {
	SqlSession session = DataSource.getInstance().openSession(true);
	ProductMapper mapper = session.getMapper(ProductMapper.class);

	@Override
	public List<ProductVO> productList(Pagination paging) {
		return mapper.getList(paging);
	}

	@Override
	public List<ProductVO> searchProduct(String keyword) {
		return mapper.searchResult(keyword);
	}

	@Override
	public ProductVO getProduct(int productId) {
		return mapper.getProduct(productId);
	}

	@Override
	public int addProductCart(ProductVO cart) {
		return mapper.insertProductCart(cart);
	}

	@Override
	public List<ProductVO> searchMenu(String menu) {
		return mapper.menuResult(menu);
	}

	@Override

	public int addZzim(ZzimVO vo) {
		return mapper.addZzimList(vo);
	}

	@Override
	public List<ProductVO> getCartList(String logId) {
		return mapper.selectCartList(logId);
	}

	@Override
	public int removeProduct(int proId) {
		return mapper.deleteProduct(proId);
	}

	@Override
	public int modifyProduct(ProductVO product) {
		return mapper.updateProduct(product);

	}

	@Override
	public int addProduct(ProductVO product) {
		return mapper.insertProduct(product);
	}

	@Override
	public int removeCart(int cartId) {
		return mapper.deleteCart(cartId);
	}

	@Override
	public List<ProductVO> getReviewList(int proId) {
		return mapper.getReviewList(proId);
	}

	@Override
	public List<ProductVO> getManageReviewList() {
		return mapper.getManageReviewList();
	}

	@Override
	public int removeReview(int revId) {
		return mapper.deleteReview(revId);
	}

	@Override
	public int updateReview(ProductVO review) {
		return mapper.updateReview(review);
	}

	@Override
	public List<ProductVO> searchReviewList(String memId, String proId) {
		return mapper.searchReviewList(memId, proId);
	}

	@Override
	public List<ProductVO> searchReviewDateList(String date) {
		return mapper.searchReviewDateList(date);
	}

	@Override
	public List<ProductVO> searchProIdList(ProductVO pvo) {
		return mapper.searchProIdList(pvo);
	}
	
	@Override
	public List<ProductVO> searchProNameList(ProductVO pvo) {
		return mapper.selectProNameList(pvo);
	}

	@Override
	public List<ProductVO> rateList() {
		return mapper.rateList();
	}
;
	@Override
	public int insertReview(ProductVO review) {
		System.out.println(review);
		return mapper.insertReview(review);
	}

	@Override
	public List<ProductVO> productList() {
		return mapper.getListMain();
	}

	@Override
	public int getPrductCount() {
		return mapper.selectProductCount();
	}

	@Override
	public List<ProductVO> getManageReviewListPage(Pagination paging) {
		return mapper.selectManageReviewListPage(paging);
	}

	@Override
	public List<ProductVO> searchProductList(String proId, String proName) {
		// TODO Auto-generated method stub
		return null;
	}

	

	
}
