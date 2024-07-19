package com.side.project;



import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.CartDAO;
import dao.MemberDAO;
import vo.CartVO;
import vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	HttpServletRequest request;

	@Autowired
	ServletContext application;
	
	public static final String VIEW_PATH = "/WEB-INF/views/member/";
	
	public MemberController(MemberDAO member_dao) {
		this.member_dao = member_dao;
	}
	
	MemberDAO member_dao;
	
	
	// 홈페이지,초기화면
	@RequestMapping(value = { "/", "/home.do" })
	public String homePage() {
		return "/WEB-INF/views/home.jsp";
	}
	
	
	// 회원가입 페이지
	@RequestMapping("/join_form.do")
	public String insert_Form() {
		return VIEW_PATH + "join.jsp";
	}

	@RequestMapping("/join.do")
	// 회원가입 처리
	public String joinId(MemberVO vo) {
		member_dao.join(vo);
		request.setAttribute("vo", vo);
		
		return "redirect:home.do";
	}
		
	//아이디 찾기
	@RequestMapping("selectid.do")
	public String selectId(MemberVO vo) {
		MemberVO id = member_dao.selectId(vo);
		
		if(id != null) {
			
			request.setAttribute("id", id.getMemberid());
			request.setAttribute("name", id.getMembername());
			
			return VIEW_PATH + "Checkid.jsp";
			
		}
		return "redirect:selectid_form.do?fail=o";
		
	}
		
		
	// 비밀번호 찾기 페이지
	@RequestMapping("selectpw_form.do")
	public String selectPw(String fail) {
		if(fail != null && !fail.isEmpty()) {
			request.setAttribute("selectpwfail", "비밀번호를 찾을 수 없습니다.\n이름, 아이디, 이메일을 확인해주세요");
		}
		return VIEW_PATH + "selectpw.jsp";
	}
			
	//비밀번호 찾기
	@RequestMapping("selectpw.do")
	public String selectPw(MemberVO vo) {
		MemberVO pw = member_dao.selectPw(vo);
	
		if(pw != null) {
			request.setAttribute("pw", pw.getPwd());
			
			return VIEW_PATH + "checkpw.jsp";
		}
		return "redirect:selectpw_form.do?fail=o";
	}

	// 로그인 페이지 로그인실패시 p태그
	@RequestMapping("/login_form.do")
	public String login_form(String fail) {
		if(fail != null && !fail.isEmpty()) {
			request.setAttribute("loginfail", "아이디 혹은 비밀번호를 확인해주세요");
		}
		return VIEW_PATH + "login.jsp";
	}
	
	// 로그인 처리
	@RequestMapping("/login.do")
	public String login(MemberVO vo, HttpSession session) {
		MemberVO login = member_dao.login(vo);

		if (login != null) {
			session.setAttribute("login", login);
				
			return "redirect:home.do";
		}
		return "redirect:login_form.do?fail=o";
	}
		
	//아이디 중복검사
	@RequestMapping("/checkid.do")
	@ResponseBody
	public String checkid(MemberVO vo) {
		int res = member_dao.checkid(vo);
		if(res == 1 ) {
			return "no";
		}
		return "yes";
	}
		
	//아이디 중복검사
	@RequestMapping("/checknickname.do")
	@ResponseBody
	public String checknickname(MemberVO vo) {
		int res = member_dao.checknickname(vo);
		if(res == 1 ) {
			return "no";
		}
		return "yes";
	}

	// 마이페이지 이동
	@RequestMapping("/mypage.do")
	public String mypage_form() {
		return VIEW_PATH + "MyPage.jsp";
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();

		return "redirect:home.do";
	}

	// 정보수정 페이지
	@RequestMapping("/modify_form.do")
	public String modify_form() {
		return VIEW_PATH + "Modify.jsp";
	}

	// 회원정보 수정
	@RequestMapping("/modify.do")
	@ResponseBody
	public String modify(MemberVO vo) {
		int res = member_dao.modify(vo);
		if(res == 0) {
			return "no";
		}
		return "yes";
	}

	// 회원탈퇴 페이지 이동
	@RequestMapping("/delete_form.do")
	public String delete_form() {
		return VIEW_PATH + "DeleteId.jsp";
	}

	// 회원탈퇴
	@RequestMapping("/delete.do")
	@ResponseBody
	public String delete(MemberVO vo) {
		int res = member_dao.delete(vo);
		
		if(res == 0 ) {
			return "no";
		}
		return "yes";
			
			
	}	
	
}
