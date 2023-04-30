<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
	<span class="fs-4"><b>ENJOY TRIP</b></span>
</a>

<ul class="nav nav-pills">
	<li class="nav-item"><a href="${root}/board?action=boardlist" id="boardnotice" name="boardnotice" class="nav-link">공지사항</a></li>
	<li class="nav-item"><a href="#" class="nav-link">공유게시판</a></li>
	<li class="nav-item"><a href="#" class="nav-link">로그인</a></li>
	<li class="nav-item"><a href="${root}/user/signup.jsp" class="nav-link">회원가입</a></li>
	<li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
	<li class="nav-item"><a href="${root}/mypage?action=mvmypage" id="mypage" name="mypage" class="nav-link">마이페이지(임시)</a></li>
</ul>