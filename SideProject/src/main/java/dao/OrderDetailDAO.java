package dao;

import org.apache.ibatis.session.SqlSession;

import vo.OrderDetailVO;

public class OrderDetailDAO {

	SqlSession sqlSession;
	
	
	public OrderDetailDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	

	
}
