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
<style type="text/css">
	.sch{width:25%;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script type="text/javascript">
<%--


--%>
//
	$(document).ready(function(){
		$("#regBtn").click(function(){
			location.href="${path}/board.do?method=insForm";
		});
		$(".data").dblclick(function(){
			//var no = $(this).children().eq(0).text();
			var no = $(this).attr("id");
			
			// board/board.do?method=detail
			location.href="${path}/board.do?method=detail&no="+no;
		});
		$("[name=pageSize]").change(function(){
			$("[name=curPage]").val(1);
			$("form").submit();
		});
		
	});
		/*
		// 1. 이전페이지 0 ==> 1	이전페이지 1
		if(page==0) page=1;
		var pageCount ='${sch.pageCount}';
		// 2. 이후페이지 페이지카운트+1 ==> 페이지 카운트로 처리.
		if(page>pageCount) page=pageCount;
		*/
	function goPage(page){
		$("[name=curPage]").val(page);
		$("form").submit();
	}
</script>
</head>
<div class="jumbotron text-center">
	<h2>게시판 기초화면</h2>
</div>
<div class="container">
	<form:form modelAttribute="sch"	method="post">
		<%--현재 클릭한 페이지번호 --%>
		<form:hidden path="curPage"/>
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<form:input path="subject" 
				class="form-control mr-sm-2 sch" placeholder="제목" />
			<form:input path="writer" 
				class="form-control mr-sm-2 sch" placeholder="작성자" />
			<button class="btn btn-info" id="regBtn" type="button">등록</button>
			&nbsp;
			<button class="btn btn-success" type="submit">Search</button>
		</nav>
		<%--총건수와 페이지 크기 표현. --%>
		<div class="input-group lb-3">
			<div class="input-group-prepend">
				<span class="input-group-text">총 : ${sch.count}건</span>
			</div>
			<input class="form-control"/>
			<div class="input-group-append">
				<span class="input-group-text">페이지 크기 : </span>
				<form:select path="pageSize" 
					items="${pageOp}" class="form-control"/>
			</div>
		</div>
</form:form>
	
	
	<table class="table table-hover table-striped">
	<col width="10%">
	<col width="50%">
	<col width="15%">
	<col width="15%">
	<col width="10%">
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
	<jsp:useBean id="today" class="java.util.Date"/>
	<%--현재날짜의 고유값 가져오기 : 1970.1.1 --%>
	<fmt:parseNumber value="${today.time/(1000*60*60*24)}" 
			var="toFmt" integerOnly="ture"/>
		<c:forEach var="bd" items="${boardList}">
		<%--등록일에 대한 고유값 --%>
	<fmt:parseNumber value="${bd.regdte.time/(1000*60*60*24)}" 
			var="crFmt" integerOnly="ture"/>
		<tr class="text-center data" id="${bd.no}">
			<td>${bd.cnt}</td>
			<td class="text-left">
			<!-- 답글의 level만큼 공백을 넣고, 마지막에 답글표기 -->
			<c:forEach varStatus="sts" begin="1" end="${bd.level}">
				<c:if test="${bd.level>1}">&nbsp;&nbsp;</c:if>
				<c:if test="${bd.level>1 and sts.last}">
					<img src="${path}/a01_img/reply.PNG" width="20" height="20"/>
				</c:if>
			</c:forEach>
			${bd.subject}
			<c:if test="${toFmt==crFmt}">
				<span class="badge badge-info">New</span>
			</c:if>
			</td>
			<td>${bd.writer}</td>
			<td><fmt:formatDate value="${bd.regdte}"/></td>
			<td>${bd.readcnt}</td>
		</tr>
		</c:forEach>
	</tbody>
	</table>
	<ul class="pagination justify-content-center" style="margin: 20px 0">
			<li class="page-item">
			<!-- 이전(previous)을 클릭시, 기본적으로 현재블럭의 시작번호 -1로 처리되게 한다. -->
				<a class="page-link" href="javascript:goPage(${sch.startBlock-1})">Previous</a>
			</li>
		<!-- 블럭은 시작 블럭과 마지막 블럭번호를 반복문으로 수행하게 한다. -->
		<c:forEach var="cnt" begin="${sch.startBlock}"end="${sch.endBlock}">
		<!-- 클릭한 현재 페이지번호와 반복되는 페이지번호가 같으면 active 적용 -->
			<li class="page-item ${sch.curPage==cnt?'active':''}"><a class="page-link"
				href="javascript:goPage(${cnt})">${cnt}</a>
			</li>
		</c:forEach>
			<li class="page-item">
			<!-- 다음(next)을 클릭시, 현재블럭의 마지막번호 +1로 처리되게 한다. -->
				<a class="page-link" 
				href="javascript:goPage(${sch.endBlock+1})">Next</a>
			</li>
	</ul>
</div>
</body>
</html>