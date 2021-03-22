<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 기초화면</title>
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
		
	});
</script>
</head>
<div class="jumbotron text-center">
	<h2>게시판 기초화면</h2>
</div>
<div class="container">
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<form:form modelAttribute="sch" class="form-inline"
	  method="post">
		<form:input path="subject" 
			class="form-control mr-sm-2" placeholder="제목" />
		<form:input path="writer" 
			class="form-control mr-sm-2" placeholder="작성자" />
		<button class="btn btn-success" type="submit">Search</button>
	</form:form>
	</nav>
	<table class="table table-hover">
	<thead>
		<tr class="table-success text-center">
        	<th>번호</th>
        	<th>제목</th>
        	<th>작성자</th>
        	<th>등록일</th>
        	<th>조회수</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="bd" items="${boardList}">
		<tr class="text-center">
			<td>${bd.no}</td>
			<td>${bd.subject}</td>
			<td>${bd.writer}</td>
			<td><fmt:formatDate value="${bd.regdte}"/></td>
			<td>${bd.readcnt}</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>    
</div>
</body>
</html>