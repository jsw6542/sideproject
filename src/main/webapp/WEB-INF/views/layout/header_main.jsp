<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="header">
  <div class="logo">Your Logo</div>
  <nav>
    <ul>
      <li><a href="/">Home</a></li>
      <li><a href="/shop">Shop</a></li>
      <li><a href="/cart">Cart</a></li>
      <c:if test="${not empty member}">
        <!-- member 객체가 존재할 때만 마이페이지 링크를 보여줌 -->
        <li><a href="mypage.do">My Account</a></li>
      </c:if>
      <c:if test="${empty member}">
        <!-- member 객체가 없으면 로그인 링크를 보여줌 -->
        <li><a href="login_form.do">Login</a></li>
      </c:if>
      <c:if test="${not empty member}">
        <!-- member 객체가 존재할 때만 로그아웃 링크를 보여줌 -->
        <li><a href="logout.do">Logout</a></li>
      </c:if>
    </ul>
  </nav>
</div>