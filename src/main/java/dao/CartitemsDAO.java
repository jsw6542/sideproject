package dao;

import org.apache.ibatis.session.SqlSession;

public class CartitemsDAO {
	SqlSession sqlSession;
	
	CartitemsDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
}
