<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

	<header	class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
		<a href="${root}/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
			<span class="fs-4"><b>Riding The Wind</b></span>
		</a>
		<c:if test="${empty userinfo}">
			<form action="">
			<ul class="nav nav-pills">
				<li class="nav-item"><a href="${root}/board?action=boardlist" id="boardnotice" name="boardnotice" class="nav-link">공지사항</a></li>
				<li class="nav-item"><a href="#" class="nav-link">공유게시판</a></li>
				<li class="nav-item"><a href="${root}/user?action=mvlogin" class="nav-link">로그인</a></li>
				<li class="nav-item"><a href="${root}/user?action=mvsignup" class="nav-link">회원가입</a></li>
				<li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
			</ul>
		</form>
		</c:if>
		<c:if test="${not empty userinfo}">
			<ul class="nav nav-pills">
				<li class="nav-item"><a href="${root}/board?action=boardlist" id="boardnotice" name="boardnotice" class="nav-link">공지사항</a></li>
				<li class="nav-item"><a href="#" class="nav-link">공유게시판</a></li>
				<li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
				<li class="nav-item"><a href="${root}/mypage?action=mvmypage" id="mvmypage" name="mvmypage" class="nav-link">마이페이지</a></li>
				<li class="nav-item"><a href="${root}/user?action=logout" class="nav-link" id="logout-btn">로그아웃</a></li>
			</ul>
		</c:if>
		
	</header>
	<script>
		document.querySelector("#logout-btn").addEventListener("click", function() {
			alert("로그아웃 완료");
		})
	</script>