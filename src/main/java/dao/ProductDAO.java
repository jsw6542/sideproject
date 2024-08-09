package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.ProductVO;

public class ProductDAO {

SqlSession sqlSession;
	
	public ProductDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//메인페이지 최근 상품 8개 불러오기
	public List<ProductVO> selectrecentproduct(ProductVO vo) {
		List<ProductVO> list = sqlSession.selectList("p.product_selectrecent",vo);
		return list;
	}
	
	//상품추가
	public int insert(ProductVO vo) {
		int insert = sqlSession.insert("p.product_insert", vo);
		return insert;
	}
	
	//상품삭제
	public int delete(ProductVO vo) {
		int delete = sqlSession.delete("p.product_delete",vo);
		return delete;
	}
	
	//전체 상품목록 불러오기
	public List<ProductVO> selectAll() {
		List<ProductVO> list = sqlSession.selectList("p.product_selectAll");
		return list;
	}
	
	//상품 상세페이지
	public ProductVO selectdetail(int productnum) {
		ProductVO product = sqlSession.selectOne("p.product_selectDetail",productnum);
		return product;
	}
	
	//상품수정
	public int update(ProductVO vo) {
		int update = sqlSession.update("p.product_update",vo);
		return update;
	}
	
	//사진 수정
	public int image(ProductVO vo) {
		int res = sqlSession.update("p.productmodify_image", vo);
		return res;
	}
	
	
	//장바구니 상품 리스트 가져오기
	public ProductVO selectbyid(int productnum) {
		ProductVO product = sqlSession.selectOne("p.product_selectbyid",productnum);
		return product;
	}
}
