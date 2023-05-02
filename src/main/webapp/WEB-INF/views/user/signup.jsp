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
        <form id="signupform" method="post" >
            <div class='container text-center' style='width: 500px; height: 100%; margin-top: 200px; margin-bottom: 200px;'>
                <h3>회원가입</h3>
                <div class="input-group mb-4 mt-4">
                    <input type="text" id="userid" name="userId" class="form-control" placeholder="아이디" required="required">
                </div>
                <div>
                    <span id="msg"></span>
                </div>
                
                <div class="input-group mb-4">
                    <input type="password" id="userpwd" name="userPassword" class="form-control" placeholder="비밀번호"  required="required">
                </div>

                <div class="input-group mb-4">
                    <input type="password" id="userpwdch" name="userPasswordch" class="form-control" placeholder="비밀번호확인"  required="required">
                </div>
                <div>
                    <span id="pwdmsg"></span>
                </div>

                <div class="input-group mb-4">
                    <input type="text" id="username" name="userName" class="form-control" placeholder="이름"  required="required">
                </div>

                <div class="input-group mb-4">
                    <input type="text" id="nickname" name="nickname" class="form-control" placeholder="닉네임"  required="required">
                </div>

                <div class="input-group mb-4">
                    <input type="text" class="form-control" placeholder="email" id="email_id" name="emailId" required="required">
                    <span class="input-group-text">@</span>
                    <input type="text" class="form-control" placeholder="domain" id="email_domain" name="emailDomain" required="required">
                </div>

                <div class="input-group mb-4">
                    <input type="text" id="phone" name="phone" class="form-control" placeholder="휴대폰"  required="required" maxlength=11>
                </div>

                
                <div class="mb-4">
                    <div class="d-flex">
                        <div class='col-md-3'><h4>생년월일</h4></div>
                        <div class='input-group mb-4'>
                            <input type="date" id="birth" name="birth" width="300px">
                        </div>

                    </div>
                </div>
                <div class='text-center pt-2 pb-1 mt-2 mb-3 bg-warning-subtle rounded-3'>
                <button id="signup-btn" type="submit" class="bg-warning-subtle" style="font-size: 1.5em; border-style: none;">
                <b>가입하기</b>
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
    <script>
        let idcheck = false;
        document.querySelector("#userid").addEventListener("keyup", function (){
            let userid = this.value;
            let resultDiv = document.querySelector("#msg");
            if(userid.length < 6) {
                resultDiv.setAttribute("class", "text-danger");
                resultDiv.textContent = "아이디가 너무 짧습니다.";
                idcheck = false;
            } else if(userid.length > 16){
                resultDiv.setAttribute("class", "text-danger");
                resultDiv.textContent = "아이디가 너무 깁니다.";
                idcheck = false;
            } else{
                fetch("/user/idcheck?userid="+userid)
                    .then(response => response.text())
                    .then(data =>{
                        console.log(data);
                        if(data == 0) {
                            resultDiv.setAttribute("class", "text-primary");
                            resultDiv.textContent = userid + "는 사용할 수 있습니다.";
                            idcheck = true;
                        } else{
                            resultDiv.setAttribute("class", "text-danger");
                            resultDiv.textContent = userid + "는 사용할 수 없슴당";
                            idcheck = false;
                        }
                    });
            }
        })



        let pwdcheck = false;
        document.querySelector("#userpwdch").addEventListener("keyup", function (){
            let pwd1 = document.querySelector("#userpwd").value;
            let pwd2 = document.querySelector("#userpwdch").value;
            let resultmsg = document.querySelector("#pwdmsg");
            if(pwd1 == pwd2){
                resultmsg.setAttribute("class","text-primary");
                resultmsg.textContent = "비밀번호가 일치합니다.";
                pwdcheck = true;

            }else{
                resultmsg.setAttribute("class","text-danger");
                resultmsg.textContent = "비밀번호가 달라영";
                pwdcheck = false;
            }
        })

        document.querySelector("#signup-btn").addEventListener("click", function (){
            if(!idcheck){
                alert("아이디를 확인한 후 다시 입력해주세요");
                event.preventDefault();
            }else if(!pwdcheck){
                alert("비밀번호가 일치하지 않습니다.");
                event.preventDefault();
            }else {
                let form = document.querySelector("#signupform");
                form.setAttribute("action","/user/signup");
                form.submit();
            }
            return false;
        })
    </script>

</body>
</html>