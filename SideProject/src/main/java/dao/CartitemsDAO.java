package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CartVO;
import vo.CartitemsVO;
import vo.ProductVO;

public class CartitemsDAO {
	SqlSession sqlSession;
	
	CartitemsDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//장바구니에 있는 아이템 cartnum으로 조회 후 가져오기
	public List<CartitemsVO> selectcartitems(int cartnum) {
		List<CartitemsVO> list = sqlSession.selectList("ci.cartitems_selectcartitems",cartnum);
		return list;
	}
	
	//장바구니에 있는 현재 상품 수
	public int itemsize(int cartnum) {
		int size = sqlSession.selectOne("ci.cartitems_itemsize",cartnum);
		return size;
	}
	
	//주문정보 조회
	/*
	 * public List<CartitemsVO> getCartItemsByOrderNum(String ordernum) { return
	 * sqlSession.selectList("CartItemsMapper.getCartItemsByOrderNum", ordernum); }
	 */
	
	//주문한 상품의 정보 조회
	public List<CartitemsVO> selectorderitems(int cartnum) {
       List<CartitemsVO> list = sqlSession.selectList("ci.cartitems_selectorderitems", cartnum);
       return list;
    }
	
}
