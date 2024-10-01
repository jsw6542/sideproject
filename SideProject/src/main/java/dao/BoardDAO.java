package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.BoardVO;
import vo.BoardVOtwo;


public class BoardDAO {

	SqlSession sqlSession;
	
	public BoardDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//전체 게시글 조회
	public List<BoardVO> selectList(BoardVOtwo vo){
		List<BoardVO> list = sqlSession.selectList("b.board_list",vo);
		return list;
	}
	
	//게시글 상세조회
	public BoardVO selectdetail(int idx) {
		BoardVO vo=sqlSession.selectOne("b.board_selectdetail",idx);
		return vo;
	}
	
	//게시글의 댓글조회
	public List<BoardVO> selectReply(int ref){
		List<BoardVO> list = sqlSession.selectList("b.board_replylist",ref);
		return list;
	}
	//전체 게시글 수 조회
	/*
	 * public int getRowTotal() { int count =
	 * sqlSession.selectOne("b.board_count",); return count; }
	 */
		
	//조회수 증가
	public int update_readhit(int idx) {
		int res = sqlSession.update("b.board_update_readhit",idx);
		return res;
	}
	
	//게시글 추가
	public int insert(BoardVO vo) {
		int insert = sqlSession.insert("b.board_insert", vo);
		return insert;
	}
	
	//게시글 삭제
	public int delete(int idx) {
		int del = sqlSession.delete("b.board_delete", idx);
		return del;
	}
	
	//게시글 수정
	public int update(int idx) {
		int update = sqlSession.delete("b.board_update", idx);
		return update;
	}
}
