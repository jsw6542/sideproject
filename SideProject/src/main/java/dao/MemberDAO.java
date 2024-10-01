package dao;

import org.apache.ibatis.session.SqlSession;

import vo.CartVO;
import vo.MemberVO;



public class MemberDAO {

SqlSession sqlSession;
	
	public MemberDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//회원가입
	public int join(MemberVO vo) {
		int join = sqlSession.insert("m.member_insert", vo);
		return join;
	}
	
	//로그인
	public MemberVO login(MemberVO vo) {
		MemberVO login = sqlSession.selectOne("m.member_login",vo);
		return login;
	}
	
	//장바구니 생성
	public int create(CartVO cvo) {
		int create = sqlSession.insert("c.cart_create", cvo);
		return create;
	}
	
	//장바구니 삭제(로그아웃시)
	public int deletecart(String memberid) {
		int delete = sqlSession.delete("c.cart_delete", memberid);
		return delete;
	}
	
	//아이디 찾기
	public MemberVO selectId(MemberVO vo) {
		MemberVO id =  sqlSession.selectOne("m.select_id", vo);
		return id;
	}
	
	//비밀번호 찾기
	public MemberVO selectPw(MemberVO vo) {
		MemberVO pw = sqlSession.selectOne("m.select_pw",vo);
		return pw;
	}
	
	//회원 정보 수정
	public int modify(MemberVO vo) {
		int update = sqlSession.update("m.member_modify", vo);
		return update;
	}
	
	//장바구니번호 조회
	public CartVO selectcartnum(String memberid) {
		CartVO selectcartnum = sqlSession.selectOne("c.cart_selectCartByMemberId",memberid);
		return selectcartnum;
	}
	
	//회원 탈퇴
	public int delete(MemberVO vo) {
		int delete = sqlSession.delete("m.member_deleteid", vo);
		return delete;
	}
		
	//아이디 중복검사
	public int checkid(MemberVO vo) {
		int check = sqlSession.selectOne("m.check_id", vo);
		return check;
	}
		
	//닉네임 중복검사
	public int checknickname(MemberVO vo) {
		int check = sqlSession.selectOne("m.check_nickname", vo);
		return check;
	}
}
