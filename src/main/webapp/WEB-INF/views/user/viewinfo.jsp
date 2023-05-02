<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <form id="signupform" method="post">
        <input type="hidden" name="action" value="updateinfo" >
            <div class='container text-center' style='width: 500px; height: 100%; margin-top: 200px; margin-bottom: 200px;'>
                <h3>개인정보</h3>
                <div class="input-group mb-4 mt-4">
                    <input type="text" id="userid" name="userid" class="form-control" placeholder="아이디" value="${userinfo.userId}" readonly>
                </div>

                <div class="input-group mb-4">
                    <input type="text" id="username" name="userName" class="form-control" placeholder="이름"  required="required" value="${userinfo.userName}" readonly>
                </div>

                <div class="input-group mb-4">
                    <input type="text" id="nickname" name="nickname" class="form-control" placeholder="닉네임"  required="required" value="${userinfo.nickname}" readonly>
                </div>

                <div class="input-group mb-4">
                    <input type="text" class="form-control" placeholder="email" id="email_id" name="email_id" value="${userinfo.emailId}" readonly>
                    <span class="input-group-text">@</span>
                    <input type="text" class="form-control" placeholder="domain" id="email_domain" name="email_domain" value="${userinfo.emailDomain}" readonly>
                </div>

                <div class="input-group mb-4">
                    <input type="text" id="phone" name="phone" class="form-control" placeholder="휴대폰"  required="required" maxlength=11 value="${userinfo.phone}" readonly>
                </div>


                <div class="mb-4">
                    <div class="d-flex">
                        <div class='col-md-3'><h4>생년월일</h4></div>
                        <div class='input-group mb-4'>
                            <input type="date" id="birth" name="birth" width="300px" value="${userinfo.birth}" readonly>
                        </div>

                    </div>
                </div>
                <div class='text-center pt-2 pb-1 mt-2 mb-3 bg-warning-subtle rounded-3'>
                <button id="signupbtn" class="bg-warning-subtle" style="font-size: 1.5em; border-style: none;">
                <b><a href="/user/update">수정하기</a></b>
                </button>
                </div>
                
    
                
                <!-- <div class="input-group">
                    <span class="input-group-text">With textarea</span>
                    <textarea class="form-control" aria-label="With textarea"></textarea>
                </div> -->
            </div>
        </form>
        <!--End of Main-->

        <!--Footer-->
        <footer class="py-3 my-4">
            <%@ include file="../common/footer.jsp" %>
        </footer>
        <!--End of Footer-->
    </div>
</body>
</html>