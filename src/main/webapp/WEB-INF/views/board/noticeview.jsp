<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.ssafy.user.model.UserDto, com.ssafy.board.model.BoardDto" %>
   
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
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3 class="text-center">공지사항</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        ${board.getTitle()}
                    </div>
                    <div class="panel-body">
                        <p>${board.getUserId()} | ${board.getRegisterTime()}</p>
                        <hr>
                        <p>${board.getContent()}</p>
                    </div>
                </div>
            </div>
        </div>
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