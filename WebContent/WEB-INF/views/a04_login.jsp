<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
<%--


--%>
//
	$(document).ready(function(){
		var loginSucc = "${loginSucc}";
		if(loginSucc=="Y"){
			alert("로그인 성공 \n 조회페이지 이동");
			$(location).attr("href","${path}/board.do?method=list");
		}
		if(loginSucc=="N"){
			alert("로그인 실패 \n인증된 계정이 아닙니다!");
			$("[name=id]").focus();
		}
	});
</script>
</head>
<div class="jumbotron text-center">
	<h2>로그인</h2>
</div>
<div class="container">
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<form class="form-inline" method="post">
		<input class="form-control mr-sm-2" type="text" 
			name="id" value=""
			placeholder="아이디"><br>
		<input class="form-control mr-sm-2" type="password" 
			name="pass"  value=""
			placeholder="패스워드"><br>
		<button class="btn btn-success" type="submit">로그인</button>
	</form>
	</nav>
</div>
</body>
</html>