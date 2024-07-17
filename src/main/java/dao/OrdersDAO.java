package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.CartVO;

public class OrdersDAO {

	SqlSession sqlSession;
	
	public OrdersDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	
	//내 장바구니 목록 확인(장바구니에 담고 주문하러왔음) CartDAO에서 가져온 장바구니 목록
	public List<CartVO> select(CartVO vo) {
		List<CartVO> list = sqlSession.selectList("c.selectlist", vo);
		return list;
	}
	
	//
}
