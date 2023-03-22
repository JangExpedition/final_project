<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/faqList.css"/>

<div id="contents">
  <div class="cols-content">
		<div class="col-aside">
		    <h2>
		        고객센터 메뉴</h2>
		    <div class="snb">
		        <ul class="ul1">
		            <li class=''><a href="${ pageContext.request.contextPath }/faq/main.do">고객센터 메인<i></i></a></li>
		            <li class=''><a href="${ pageContext.request.contextPath }/faq/faqList.do">자주찾는 질문<i></i></a></li>
		            <li class=''><a href="${ pageContext.request.contextPath }/notice/noticeList.do">공지/뉴스<i></i></a></li>
		            <li class=''><a href="${ pageContext.request.contextPath }/question/question.do">1:1 문의<i></i></a></li>
		            <li class='on'><a href="${ pageContext.request.contextPath }/question/myQuestionList.do">문의 내역 확인<i></i></a></li>
		        </ul>
		    </div>
		</div>
		<div class="col-detail">
			<div class="customer_top">
				<div class="customer_top">
				<h2 class="tit">문의 내역 확인</h2>
				<p class="stit"> 제목과 휴대폰 번호를 통해 문의하셨던 내역을 조회해보세요</p>
			</div>
			</div>
			
			<br>
			
			<form:form action="${pageContext.request.contextPath}/question/searchByName" method="get" class="mb-3">
			  <div class="input-group">
			    <input type="hidden" name="searchType" value="name" />
			    <input type="text" class="form-control" id="myElement" placeholder="이름 검색" aria-label="Recipient's username" aria-describedby="button-addon2" name="name" />
			    <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
			  </div>
			</form:form>
			
			
			<div class="tbl_area">
				<table cellspacing="0" cellpadding="0" class="tbl_notice_list">
				  <thead>
				    <tr>
				      <th scope="col">문의 번호</th>
				      <th scope="col">제목</th>
 				      <th scope="col">문의 유형</th>
				      <th scope="col">이름</th>
<!-- 				      <th scope="col">이메일</th> -->
				      <th scope="col">문의일</th>
				    </tr>
				  </thead>
				  <tbody>
				    <c:forEach items="${questionList}" var="question">
				      <tr data-no="${question.no}">
				        <td>${question.no}</td>
				        <td>${question.title}</td>
 				        <td>${question.type.krName}</td>
				        <td>${question.name}</td>
<%-- 				        <td>${question.email}</td> --%>
				        <td>
				          <fmt:parseDate value="${question.regDate}" pattern="yyyy-MM-dd" var="regDate"/>
				          <fmt:formatDate value="${regDate}" pattern="yy/MM/dd"/>
				        </td>
				      </tr>
				    </c:forEach>   
				  </tbody>  
				</table>
			</div>
		</div>
  	</div>
</div>	
		
		
<script>
document.querySelectorAll("tr[data-no]").forEach((tr) => {
		tr.addEventListener('click', (e) => {
			const no = tr.dataset.no;
			console.log(no);
			location.href = '${pageContext.request.contextPath}/question/myQuestionDetail.do?no=' + no;
	});
});
</script>

</body>
</html>