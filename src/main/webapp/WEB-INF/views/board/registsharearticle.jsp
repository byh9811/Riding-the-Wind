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
            <div class="container" style="width: 700px;">
				<h2 class="my-3 py-3 shadow-sm bg-light text-center">
					<div class="">게시글 등록</div>
				</h2>
                <form action="submit.jsp" method="post">
            
                    <!-- 제목 입력 필드 -->
                    <div class="form-group">
                        <label for="title">제목:</label>
                        <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력하세요">
                    </div>
            
                    <!-- 내용 입력 필드 -->
                    <div class="form-group mb-4">
                        <label for="content">내용:</label>
                        <textarea style="height: 400px;" class="form-control" id="content" name="content" placeholder="내용을 입력하세요"></textarea>
                    </div>
            
                    <!-- 등록 버튼 -->
                    <button type="submit" class="btn btn-primary">등록</button>
                </form>
            </div>

        </div>
        <!-- End of Main-->

        <!--Footer-->
        <footer class="py-3 my-4">
            <%@ include file="../common/footer.jsp" %>
        </footer>
        <!--End of Footer-->

    </div>
</body>


</html>