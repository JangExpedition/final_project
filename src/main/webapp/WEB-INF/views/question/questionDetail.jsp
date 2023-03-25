<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="예매|영화 그 이상의 감동. J3L" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/questionDetail.css"/>


<div id="contents">
	<div class="cols-content">
		<div class="col-aside">
			<div class="snb">
				<ul class="ul1">
					<li class=''><a href="${ pageContext.request.contextPath }/member/memberList.do">회원 관리<i></i></a>
					</li>
					<li class=''><a href="${ pageContext.request.contextPath }/movie/movieList.do">영화 관리<i></i></a></li>
					<li class='on'><a href="${ pageContext.request.contextPath }/question/questionList.do">문의
							관리<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/schedule/insertSchedule2.do">상영
							관리<i></i></a></li>
				</ul>
			</div>
		</div>
		<h1>문의 답변</h1>
		<table class="ttbl">
			<input type="hidden" name="no" value="${question.no}">
			<tr>
				<td class="tit">제목</td>
				<td>${question.title}</td>
			</tr>
			<tr>
				<td class="tit">문의자</td>
				<td>${question.name}</td>
			</tr>
			<tr>
				<td class="tit">전화번호</td>
				<td>${question.phone}</td>
			</tr>
			<tr>
				<td class="tit">문의일</td>
				<td>
					<fmt:parseDate value="${question.regDate}" pattern="yyyy-MM-dd" var="regDate" />
					<fmt:formatDate value="${regDate}" pattern="yy/MM/dd" />
				</td>
			</tr>
			<tr>
				<td class="tit">문의 유형</td>
				<td>${question.type.krName}</td>
			</tr>
			<tr>
				<td class="tit">문의 내용</td>
				<td>${question.content}</td>
			</tr>
			<form:form name="questionAnswerEnrollFrm"
				action="${pageContext.request.contextPath}/questionAnswer/questionAnswerEnroll.do" method="post">
				<tr>
					<td class="tit">답변 내용</td>
					<td>
						<textarea name="content" placeholder=""></textarea>
						<input type="hidden" value="${question.no}" name="qNo" />
						<input type="hidden" value="admin" name="id" />
						<input type="submit" id="submit" value="답변 등록" />
					</td>
				</tr>
			</form:form>
		</table>
		<div class="fn1">
			<form:form name="questionDeleteFrm" action="${pageContext.request.contextPath}/question/deleteQuestion.do"
				method="post">
				<input type="hidden" name="no" value="${question.no}">
				<input type="submit" value="삭제" />
			</form:form>
		</div>
	</div>
</div>
</body>
</html>