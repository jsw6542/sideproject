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
	CartDAO cart_dao;

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

	// 아이디 찾기
	@RequestMapping("selectid.do")
	public String selectId(MemberVO vo) {
		MemberVO id = member_dao.selectId(vo);

		if (id != null) {

			request.setAttribute("id", id.getMemberid());
			request.setAttribute("name", id.getMembername());

			return VIEW_PATH + "checkid.jsp";

		}
		return "redirect:selectid_form.do?fail=o";

	}

	// 비밀번호 찾기 페이지
	@RequestMapping("selectpw_form.do")
	public String selectPw(String fail) {
		if (fail != null && !fail.isEmpty()) {
			request.setAttribute("selectpwfail", "비밀번호를 찾을 수 없습니다.\n이름, 아이디, 이메일을 확인해주세요");
		}
		return VIEW_PATH + "selectpw.jsp";
	}

	// 비밀번호 찾기
	@RequestMapping("selectpw.do")
	public String selectPw(MemberVO vo) {
		MemberVO pw = member_dao.selectPw(vo);

		if (pw != null) {
			request.setAttribute("pw", pw.getPwd());

			return VIEW_PATH + "checkpw.jsp";
		}
		return "redirect:selectpw_form.do?fail=o";
	}

	// 로그인 페이지 로그인실패시 p태그
	@RequestMapping("/login_form.do")
	public String login_form(String fail) {
		if (fail != null && !fail.isEmpty()) {
			request.setAttribute("loginfail", "아이디 혹은 비밀번호를 확인해주세요");
		}
		return VIEW_PATH + "login.jsp";
	}

	// 로그인 처리
	@RequestMapping("/login.do")
	public String login(MemberVO vo, HttpSession session, CartVO cvo) {
		MemberVO login = member_dao.login(vo);

		if (login != null) {
			System.out.println("로그인한 사용자 역할: " + login.getMemberid()); // 역할 확인
			// 이후 권한 체크 로직
		}

		if (login != null) {
			session.setAttribute("login", login);
			session.setAttribute("memberid", login.getMemberid());
			String memberid = login.getMemberid();

			// 기존 장바구니 가져오기
			CartVO cart = member_dao.selectcartnum(memberid);

			// 장바구니가 없을 경우 새 장바구니 추가
			if (cart == null) {
				int newCartNum = member_dao.create(cvo); // 장바구니 추가
				System.out.println("새 장바구니 추가 완료: " + newCartNum);
				cart = member_dao.selectcartnum(memberid); // 새 장바구니 불러오기
			} else {
				System.out.println("기존 장바구니를 불러왔습니다: " + cart.getCartnum());
			}
			
			session.setAttribute("cart", cart); // 세션에 장바구니 정보 저장
			
			session.setAttribute("cartnum", cart.getCartnum());
			System.out.println("로그인시 가져오는 세션의 cartnum : "+ cart.getCartnum());
			
			int cartnum = cart.getCartnum();
			System.out.println("장바구니 번호: " + cartnum);

			// 사용자 권한 확인 후 리다이렉트
			if ("admin".equals(login.getMemberid())) { // 관리자 권한 확인
				return "redirect:adminpage.do"; // 관리자 페이지로 이동
			} else {
				return "redirect:home.do"; // 일반 사용자 홈 페이지로 이동
			}
		}

		return "redirect:login_form.do?fail=o";
	}

	// 아이디 중복검사

	@RequestMapping("/checkid.do")
	@ResponseBody
	public String checkid(MemberVO vo) {
		int res = member_dao.checkid(vo);
		if (res == 1) {
			return "no";
		}
		return "yes";
	}

	// 아이디 중복검사
	@RequestMapping("/checknickname.do")
	@ResponseBody
	public String checknickname(MemberVO vo) {
		int res = member_dao.checknickname(vo);
		if (res == 1) {
			return "no";
		}
		return "yes";
	}

	// 마이페이지 이동
	@RequestMapping("/mypage.do")
	public String mypage_form() {
		return VIEW_PATH + "mypage.jsp";
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {

		String memberid = (String) session.getAttribute("memberid");
		System.out.println(memberid);

		//member_dao.deletecart(memberid);  로그아웃시 장바구니가 사라지는 이유이다.
		session.removeAttribute("cart"); // 세션에서 장바구니 제거 
		
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
		if (res == 0) {
			return "no";
		}
		return "yes";
	}

	// 회원탈퇴 페이지 이동
	@RequestMapping("/delete_form.do")
	public String delete_form() {
		return VIEW_PATH + "deleteid.jsp";
	}

	// 회원탈퇴
	@RequestMapping("/delete.do")
	@ResponseBody
	public String delete(MemberVO vo) {
		int res = member_dao.delete(vo);

		if (res == 0) {
			return "no";
		}
		return "yes";

	}

	// 관리자 페이지 이동
	@RequestMapping("/adminpage.do")
	public String adminpage() {
		return "/WEB-INF/views/adminpage.jsp";
	}

}
