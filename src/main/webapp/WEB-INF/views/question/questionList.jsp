<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/memberList.css"/>

<div id="contents">
  <div class="cols-content">
		<div class="col-aside">
		    <h2>
		        고객센터 메뉴</h2>
		    <div class="snb">
		        <ul class="ul1">
		            <li class=''><a href="${ pageContext.request.contextPath }/member/memberList.do">회원 관리<i></i></a></li>
		            <li class=''><a href="${ pageContext.request.contextPath }/movie/movieList.do">영화 관리<i></i></a></li>
		            <li class='on'><a href="${ pageContext.request.contextPath }/question/questionList.do">문의 관리<i></i></a></li>
		            <li class=''><a href="${ pageContext.request.contextPath }/scheduel/scheduelList.do">상영 시간 관리<i></i></a></li>
		        </ul>
		    </div>
		</div>
		<div class="col-detail">
			<div class="customer_top">
				<h2 class="tit">문의 관리</h2>
			</div>
			
			<br>
			
			<div class="c_tab_wrap">
			</div>
			<div class="tbl_area">
				<table cellspacing="0" cellpadding="0" class="tbl_notice_list">
				  <thead>
				    <tr>
				      <th scope="col"> </th> 
				      <th scope="col">번호</th>
				      <th scope="col">이름</th>
				      <th scope="col">문의유형</th>
				      <th scope="col">제목</th>
				      <th scope="col">이메일</th>
				      <th scope="col">문의일</th>
				    </tr>
				  </thead>
				  <tbody>
				    <c:forEach items="${questionList}" var="question">
				      <tr>
				        <td><input type="checkbox" name="selectedQuestions" value="${question.no}"></td> <!-- add a checkbox column -->
				        <td>${question.no}</td>
				        <td>${question.name}</td>
				        <td>${question.type.krName}</td>
				        <td>${question.title}</td>
				        <td>${question.email}</td>
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
/* document.querySelectorAll("tr[data-no]").forEach((tr) => {
	tr.addEventListener('click', (e) => {
		const no = tr.dataset.no;
		console.log(no);
		location.href = '${pageContext.request.contextPath}/movie/movieDetail.do?no=' + no;
	});
}); */
</script>
</body>
</html>