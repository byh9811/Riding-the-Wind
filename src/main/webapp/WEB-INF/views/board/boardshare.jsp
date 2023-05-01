<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="../common/head.jsp" %>
</head>
<body>
	<div class='container'>
		<!--Header -->
		<%@ include file="../common/header.jsp" %>
		<!--End of Header-->


		<!--Main-->
		<div class='container d-flex '>


			<!-- board start -->
			<div class="container p-4">

				<div class="row justify-content-center">
					<div class="col-lg-8 col-md-10 col-sm-12">
						<h2 class="my-3 py-3 shadow-sm bg-light text-center">
							<div class="">자유게시판</div>
						</h2>
					</div>
					<div class="col-lg-8 col-md-10 col-sm-12">
						<div class="row align-self-center mb-2">
							<div class="col-md-2 text-start"></div>
							<div class="col-md-7 offset-3"></div>
						</div>
						<table class="table table-hover">
							<colgroup>
								<col width="100px" />
								<col width="*" />
								<col width="100px" />
								<col width="100px" />
							</colgroup>
							<thead>
								<tr class="text-center">
									<th scope="col">번호</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">게시일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="article" items="${articles}">
									<tr class="text-center">
										<th scope="row">${article.articleNo}</th>
										<td class="text-start"><a href="#"
											class="article-title link-dark"
											data-no="${article.articleNo}" style="text-decoration: none">
												${article.title} </a></td>
										<td>${article.registerTime}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- board end -->
		</div>


		<!--End of Main-->



		<!--Footer-->
		<footer class="py-3 my-4">
            <%@ include file="../common/footer.jsp" %>
		</footer>
		<!--End of Footer-->
	</div>

</body>
</html>