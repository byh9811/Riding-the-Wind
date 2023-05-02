<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../common/head.jsp" %>
    <link
</head>
<body>
<div class='container'>
    <!--Header -->
    <%@ include file="../common/header.jsp" %>
    <!--End of Header-->


    <!--Main-->
    <form id="changepwdform" method="post" >
        <div class='container text-center' style='width: 500px; height: 100%; margin-top: 200px; margin-bottom: 200px;'>
            <h2>비밀번호 변경</h2>
            <div class="input-group mb-4">
                <span style="width: 170px">현재 비밀번호</span>
                <input type="password" id="userpwd" name="userpwd" class="form-control" placeholder="비밀번호"  required="required">
            </div>
            <div>
                <span id="prepwd"></span>
            </div>
            <div></div>
            <div class="input-group mb-4">
                <span style="width: 170px">새 비밀번호</span>
                <input type="password" id="newpwd" name="newpwd" class="form-control" placeholder="비밀번호"  required="required">
            </div>
            <div class="input-group mb-4">
                <span style="width: 170px">비밀번호 확인</span>
                <input type="password" id="newpwdcheck" name="newpwdcheck" class="form-control" placeholder="비밀번호"  required="required">
            </div>
            <div class="text-center">
                <button id="pwdchange-btn">변경하기</button>
            </div>
        </div>
    </form>
    <!--End of Main-->

    <!--Footer-->
    <footer class="py-3 my-4">
        <%@ include file="../common/footer.jsp" %>
    </footer>
    <!--End of Footer-->
</div>
<script>
    let userpwd = "${userpwd}";

    document.querySelector("#pwdchange-btn").addEventListener("click", function(event) {
        let pwd1 = document.querySelector("#newpwd").value;
        let pwd2 = document.querySelector("#newpwdcheck").value;
        console.log(pwd1);
        console.log(pwd2);

        if (document.querySelector("#userpwd").value !== userpwd) {
            alert("현재 비밀번호가 일치하지 않습니다.");
            event.preventDefault();
        } else if (pwd1 !== pwd2) {
            alert("새 비밀번호를 확인하세요");
            event.preventDefault();
        } else{
            let form = document.querySelector("#changepwdform");
            form.setAttribute("action", "/user/changepwd");
            form.submit();
            alert("비밀번호가 변경되었습니다.");
        }
    });
</script>



</body>
</html>