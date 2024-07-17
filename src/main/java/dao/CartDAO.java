package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;



import vo.CartVO;

public class CartDAO {

SqlSession sqlSession;
	
	public CartDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//장바구니에 상품 추가
	public int insert(CartVO vo) {
		int insert = sqlSession.insert("c.insert", vo);
		return insert;
	}
	
	//장바구니 목록
	public List<CartVO> select(CartVO vo) {
		List<CartVO> list = sqlSession.selectList("c.selectlist", vo);
		return list;
	}
	
	//장바구니 삭제
	public int delete(CartVO vo) {
		int delete = sqlSession.delete("c.delete", vo);
		return delete;
	}
	
	//장바구니 수정
	public int update(CartVO vo) {
		int update = sqlSession.update("c.update", vo);
		return update;
	}
	
	
	//장바구니 수량 변경
	


}
