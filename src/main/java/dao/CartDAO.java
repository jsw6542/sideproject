package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CartitemsVO;
import vo.CartVO;
import vo.ProductVO;

public class CartDAO {

SqlSession sqlSession;
	
	public CartDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	
	//장바구니에 물품을 추가 이것은 update를 사용해야하는거아닌가?
	public List<CartitemsVO> selectcartall(CartVO vo) {
		List<CartitemsVO> cartitems = sqlSession.selectList("c.cart_cartlist",vo.getCartnum());
		return cartitems;
	}
	
	// 장바구니 아이템 조회
    public List<CartitemsVO> selectCartItems(int cartnum) {
        return sqlSession.selectList("cart.selectCartItemsByCartNum", cartnum);
    }
	
	
	//상품정보 조회
	public ProductVO selectdetail(int productnum) {
		ProductVO product = sqlSession.selectOne("p.product_selectDetail",productnum);
		return product;
	}
	


}
