package dao;

import org.apache.ibatis.session.SqlSession;

import vo.OrderDetailVO;

public class OrderDetailDAO {

	SqlSession sqlSession;
	
	
	public OrderDetailDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//주문번호
	public int ordernum(OrderDetailVO vo) {
		int num = sqlSession.selectOne("d.ordernum", vo);
		return num;
	}
	
	//상품번호
	public int productnum(OrderDetailVO vo) {
		int productnum = sqlSession.selectOne("d.productnum", vo);
		return productnum;
	}
	
	//수량
	public int quantity(OrderDetailVO vo) {
		int quantity = sqlSession.selectOne("d.quantity", vo);
		return quantity;
	}
	
	//배송상태 배송전1 배송완료2
	public int deliver(OrderDetailVO vo) {
		int deliver = sqlSession.selectOne("d.deliver", vo);
		return deliver;
	}
	
	
}
