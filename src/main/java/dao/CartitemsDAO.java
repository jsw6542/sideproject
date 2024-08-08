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
	
    
}
