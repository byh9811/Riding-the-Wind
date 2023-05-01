<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="checked" value="checked"></c:set>
<c:set var="saveId" value="${cookie.ssafy_id.value}"></c:set>
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
        <div class='container text-center' style='width: 500px; height: 100%; margin-top: 200px; margin-bottom: 300px;'>
            <h3>로그인</h3>
            <!-- <div class="input-group mb-3">
                <input type="text" class="form-control" placeholder="sampleinput" aria-label="Recipient's username" aria-describedby="basic-addon2">
                <span class="input-group-text" id="basic-addon2">@example.com</span>
            </div> -->
            <form id="form-login" method="POST" action="">
	            <div class="input-group mb-4 mt-4">
	                <input type="text" class="form-control" id="userid" name="userid" placeholder="아이디">
	                <div class="form-check mb-3 float-end">
		              <br>
		              <input
		                class="form-check-input"
		                type="checkbox"
		                value="ok"
		                id="saveid"
		                name="saveid"
		              />
		              <label class="form-check-label" for="saveid"> 아이디저장 </label>
		            </div>
	            </div>
	            
	            <div class="input-group mb-4">
	                <input type="password" class="form-control" placeholder="비밀번호" id="userpwd", name="userpwd">
	            </div>
            </form>
            <div class='text-center pt-2 pb-1 mt-2 mb-3 bg-warning-subtle rounded-3'><button id="btn-login" class="bg-warning-subtle" type="button" style="border-style: none; background-color: white; font-size: 1.5em; width: auto;">로그인</button></div>
            <div class="row text-center" style='width: 80%; margin: auto;'>
                <div class="col-md-4"><button type="button" style="border-style: none; background-color: white">아이디 찾기</button></div> 
                <div class="col-md-4"><button type="button" style="border-style: none; background-color: white;">비밀번호 찾기</button></div> 
                <div class="col-md-4"><button type="button" id="btn-mv-join" style="border-style: none; background-color: white">회원가입</button></div>
            </div>
            

            

            
            <!-- <div class="input-group">
                <span class="input-group-text">With textarea</span>
                <textarea class="form-control" aria-label="With textarea"></textarea>
            </div> -->
        </div>
        <!--End of Main-->
        <!--Footer-->
        <footer class="py-3 my-4">
            <%@ include file="../common/footer.jsp" %>
        </footer>
        <!--End of Footer-->
    </div>
  	<script>
	  	document.querySelector("#btn-mv-join").addEventListener("click", function () {
	    	location.href = "${root}/user?action=mvsignup";
	      });
	  	
	  	document.querySelector("#btn-login").addEventListener("click", function () {
		  	if (!document.querySelector("#userid").value) {
		          alert("아이디 입력!!");
		          return;
		        } else if (!document.querySelector("#userpwd").value) {
		          alert("비밀번호 입력!!");
		          return;
		        } else {
		          let form = document.querySelector("#form-login");
		          form.setAttribute("action", "${root}/user/signin");
		          form.submit();
		        }
	    	});
  	</script>
</body>
</html>