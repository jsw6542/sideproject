package com.side.project;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardDAO;
import vo.BoardVO;
import vo.BoardVOtwo;

@Controller
public class BoardController {

	@Autowired
	HttpServletRequest request;
	
	@Autowired
	ServletContext application;
	
	public static final String VIEW_PATH = "/WEB-INF/views/board/";
	
	BoardDAO board_dao;
	
	public BoardController(BoardDAO board_dao) {
		this.board_dao = board_dao;
	}
	
	//게시판 글 전체 조회   페이징 처리 해 야 함
	@RequestMapping("/boardlist.do")
	public String boardlist(BoardVOtwo vo,Model model) {
		List<BoardVO> boardlist = board_dao.selectList(vo);
		
		model.addAttribute("boardlist", boardlist);
		
 		return VIEW_PATH + "list.jsp";
	}
	
	//게시판 등록 페이지
	@RequestMapping("/boardinsert_form.do")
	public String write_form() {
		
		return VIEW_PATH + "write.jsp";
	}
	
	//게시판 등록
	@RequestMapping("/boardinsert.do")
	public String boardisnert(BoardVO vo) {
		
		String webPath = "/resources/board_img/";
		String savePath = application.getRealPath(webPath);//절대경로
		
		System.out.println("절대 경로확인 : " + savePath);//잘들어갔는지 확인
	
		MultipartFile boardimage = vo.getBoardimage();
		
		String boardimage_path = "no_file";
		
		if (!boardimage.isEmpty()) { //사진을 넣는다면
			boardimage_path = boardimage.getOriginalFilename();//업로드된 파일명을 가져옴
			
			//파일을 저장할 경로
			File saveFile = new File(savePath, boardimage_path);
			//System.out.println("테스트1");
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				// 파일명 중복방지
				long time = System.currentTimeMillis();
				boardimage_path = String.format("%d_%s", time, boardimage_path);
				saveFile = new File(savePath, boardimage_path);
			}

			try {
				//지정된 경로에 실제 파일을 물리적으로 복사
				boardimage.transferTo(saveFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		//System.out.println("테스트2");
		System.out.println(boardimage_path);
		
		vo.setBoardimage_path(boardimage_path); //"resources/game_img/" + filename이였음
		
	    board_dao.insert(vo);

		return "redirect:boardlist.do";
		
	}
	
	//게시판 수정 페이지
	@RequestMapping("/boardmodify_form.do")
	public String modify_form(@RequestParam("boardidx") int boardidx, Model model) {
		BoardVO vo = board_dao.selectdetail(boardidx);
		model.addAttribute("vo", vo);
		
		return VIEW_PATH + "modify.jsp";
	}
	
	//게시판 수정
	@RequestMapping("/boardmodify.do")
	public String modify(int idx) {
		
		int modify = board_dao.modify(idx);
		if(modify == 0) {
			return "no";
		}
		return VIEW_PATH + "list.jsp";
	}
	
	//게시판 삭제
	@RequestMapping("/boarddelete.do")
	public String boarddelete(int idx) {
		int del = board_dao.delete(idx);
		
		if(del == 1 ) {
			return "no";
		}
		
		return "redirect:/boardlist.do";
	}
	
	
	//게시판의 상세페이지 조회
	@RequestMapping("/boarddetail.do")
	public String view(@RequestParam("boardidx") int boardidx, Model model) {
		BoardVO vo = board_dao.selectdetail(boardidx);

		List<BoardVO> list = board_dao.selectReply(vo.getRef());
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
		
	//상세페이지 클릭 시 조회수 증가
	HttpSession session = request.getSession();
	String show = (String)session.getAttribute("show"); 		
		if(show == null) {
		int res = board_dao.readhit(boardidx);
		session.setAttribute("show", "1");
		}
		//request.setAttribute("vo", vo);
			
		return VIEW_PATH + "detail.jsp";
	}
	
	//댓글 쓰기
	
	
}
