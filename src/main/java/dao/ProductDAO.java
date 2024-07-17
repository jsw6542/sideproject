package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ProductVO;

public class ProductDAO {

SqlSession sqlSession;
	
	public ProductDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//상품추가
	public int insert(ProductVO vo) {
		int insert = sqlSession.insert("p.product_insert", vo);
		return insert;
	}
	
	//상품삭제
	public int delete(ProductVO vo) {
		int delete = sqlSession.delete("p.delete",vo);
		return delete;
	}
	
	//전체 상품목록 불러오기
	public List<ProductVO> selectAll() {
		List<ProductVO> list = sqlSession.selectList("p.product_selectAll");
		return list;
	}
	
	//상품수정
	public int update(ProductVO vo) {
		int update = sqlSession.update("p.update",vo);
		return update;
	}
	
	//사진 수정
	public int image(ProductVO vo) {
		int res = sqlSession.update("p.productmodify_image", vo);
		return res;
	}
}
