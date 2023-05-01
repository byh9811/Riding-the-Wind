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
					<div class="">공지사항 등록</div>
				</h2>
                <form method="post" id ="form" name="form">
            		<input type="hidden" name="action" value="registnotice">
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
                    <button type="submit" class="btn btn-primary" id ="registnotice">등록</button>
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
    <script>
	    document.querySelector("#registnotice").addEventListener("click", function() {
	        if(!document.querySelector("#title").value){
	            alert("제목 입력!");
	            return;
	        } else if(!document.querySelector("#content").value) {
	            alert("내용 입력!");
	            return;
	        } else{
	            let form = document.querySelector("#form");
	            form.setAttribute("action", "${root}/board");
	            form.submit();
	        }
	    })
    </script>
</body>


</html>