<%-- a03_boardDetail.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="path" value="${pageContext.request.contextPath}"/> 
<fmt:requestEncoding value="UTF-8" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
   .input-group-text{
      width:100%; background-color:linen; color:black;
      font-weight:bolder;
   }
   .input-group-prepend{width:20%;}
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
		$("#logout").click(function(){
			location.href="${path}/board.do?method=logout";
		});
		var sessId = "${sesMem.id}";
		if(sessId==""){
			alert("로그인이 필요합니다!\n로그인화면으로 이동");
			location.href="${path}/board.do?method=login";
		};
      var memId = "${mem.id}";
      
      var proc = "${param.proc}"; 
      if(proc == "upt"){
         if(confirm("수정완료\n조회페이지로 이동하시겠습니까?")){
            location.href="${path}/board.do?method=list";
         }
      }else if(proc=="del"){
    	  alert("삭제 되었습니다")
    	  $(location).attr("href","${path}/board.do?method=list");
      }
      
      $("#goMain").on("click",function(){
         location.href="${path}/board.do?method=list";
      });
      // 파일 다운로드 처리..
      $("#uptBtn").click(function(){
         var writer = $("[name=writer]").val();
         if(memId == writer){
              if(confirm("수정하시겠습니까?")){
               $("[name=proc]").val("upt");
               $("form").attr("action","${path}/board.do?method=update");
               $("form").submit();   
              }   
         } else {
            alert("수정권한이 없습니다.\n작성자만 수정이 가능합니다");
         }
         // 삭제 버튼 클릭 시도 권한에 따른 프로세스가 진행되게
      })
      
      $(".custom-file-input").on("change",function(){
         $(this).next(".custom-file-label").text($(this).val());
      });
      
      $("#reBtn").click(function(){
         if(confirm("답글을 달겠습니다!")){
        	 // 답글 처리를 위한 데이터 처리.
        	 $("[name=refno]").val($("[name=no]").val());
        	 $("[name=subject]").val("RE:"+$("[name=subject]").val());
        	 $("[name=content]").val(
        			 "\n\n\n\n\n\n\n\n"+
        			 "===== 이전 글 =====\n" +
        			 $("[name=content]").val());
        	
            $("form").attr("action",
            		"${path}/board.do?method=insForm");
            $("form").submit();
         }
      })
      
      $("[name=fnames]").click(function(){
         var fname = $(this).val();
         if(confirm("파일을 다운로드 하시겠습니까?")){
            location.href="${path}/board.do?method=download&fname="+fname;
         }
      });
      $("#delBtn").click(function(){
    	  var writer = $("[name=writer]").val();
    	  //if(sessId=writer)
    		  if(confirm("삭제하시겠습니까?")){
    			  //var no = $("input[name=no]").val(); post방식 필요X
    			  $("[name=proc]").val("del");
    			  $("form").attr("action","${path}/board.do?method=delete");
    			  $("form").submit();
    		  }
    		  else{
    	  			alert("삭제권한이 없습니다.\n작성자만 삭제가 가능합니다!");
				}
   		});
      
   });
</script>
</head>
<div class="jumbotron text-center">
  <h2>게시판 상세화면(${param.no })</h2>
</div>
<div class="container">
     <form method="post" enctype="multipart/form-data">
     <input type="hidden" name="proc" />
     <div class="input-group mb-3">
        <div class="input-group-prepend">
           <span class="input-group-text">글번호</span>
        </div>
          <input class="form-control" 
          name="no" value="${board.no }" readonly>
        <div class="input-group-prepend">
           <span class="input-group-text">상위글번호</span>
        </div>
        <input class="form-control" type="text" 
          name="refno" value="${board.refno }" readonly>
     </div>
       
          
      <div class="input-group mb-3">
        <div class="input-group-prepend">
           <span class="input-group-text">작성자</span>
        </div>
           <input class="form-control" type="text" 
          name="writer" value="${board.writer }" readonly>
        <div class="input-group-prepend">
           <span class="input-group-text">조회수</span>
        </div>
         <input class="form-control" type="text" 
          name="readcnt" value="${board.readcnt }" readonly>
     </div>
      
    
    <div class="input-group mb-3">
        <div class="input-group-prepend">
           <span class="input-group-text">제목</span>
        </div>
         <input class="form-control" type="text" 
          name="subject" value="${board.subject }">             
     </div>
      
     <div class="input-group mb-3">
        <div class="input-group-prepend">
           <span class="input-group-text">등록일</span>
        </div>
        <input class="form-control" type="text" 
          name="regdte" value="<fmt:formatDate type='both' pattern='yyyy/MM/dd HH:mm:ss' value='${board.regdte}'/>" readonly>
        <div class="input-group-prepend">
           <span class="input-group-text">수정일</span>
        </div>
          <input class="form-control" type="text" 
          name="uptdte" value="<fmt:formatDate type='both' pattern='yyyy/MM/dd HH:mm:ss' value='${board.uptdte }'/>" readonly>  
     </div>
<%--
   <input class="form-control" type="text" 
          name="regdte" value="<fmt:formatDate type='both' pattern='yyyy/MM/dd HH:mm:ss' value='${board.regdte}'/>" readonly>
        
 --%>
     <div class="input-group mb-3">
        <div class="input-group-prepend">
           <span class="input-group-text">내용</span>
        </div>
         <textarea class="form-control" rows="10"
          name="content">${board.content }</textarea>
     </div>
      
     <c:set var="fcnt" value="${board.fileInfo.size()}"/>
     <c:forEach var="finf" items="${board.fileInfo}" varStatus="sts">
     <div class="input-group mb-3">
        <div class="input-group-prepend">
           <span class="input-group-text">첨부파일(${sts.count}/${fcnt})</span>
        </div>
        <!-- 다운로드할 파일 정보 -->
        <input class="form-control fileInfo" name="fnames" value="${finf.fname}"/>
         <div class="custom-file">
           <!--변경할  파일정보(report ==> vo 의 property) -->
           <input type="file" name="report" class="custom-file-input" id="file01" readonly/>
           <label class="custom-file-label" for="file01">
           변경하려면 파일을 선택하세요!</label>
        </div>
     </div>
     </c:forEach>
     <div style="text-align:right;">
        <input type="button" class="btn btn-info" value="수정" id="uptBtn"/>
        <input type="button" class="btn btn-danger" value="삭제" id="delBtn"/>
        <input type="button" class="btn btn-warning" value="답글" id="reBtn"/>
        <input type="button" class="btn btn-success" value="조회화면으로" id="goMain"/>
     </div>
    
             
     </form>
     
</div>
</body>
</html>