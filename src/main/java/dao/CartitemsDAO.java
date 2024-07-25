package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CartVO;
import vo.CartitemsVO;

public class CartitemsDAO {
	SqlSession sqlSession;
	
	CartitemsDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//장바구니에 있는 아이템 cartnum으로 가져오기
	public List<CartitemsVO> selectcartitems(int cartnum) {
		List<CartitemsVO> selectcartitems = sqlSession.selectList("c.cartitems_selectcartitemslist",cartnum);
		return selectcartitems;
	}
	
	
}
