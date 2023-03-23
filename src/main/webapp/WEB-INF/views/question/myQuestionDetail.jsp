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
<%-- <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/admin.css"/> --%>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/myQuestionDetail.css"/>


<div id="contents">
	<div class="cols-content">
		<div class="col-aside">
			<div class="snb">
				<ul class="ul1">
					<li class=''><a href="${ pageContext.request.contextPath }/faq/main.do">고객센터 메인<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/faq/faqList.do">자주찾는 질문<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/notice/noticeList.do">공지/뉴스<i></i></a>
					</li>
					<li class=''><a href="${ pageContext.request.contextPath }/question/question.do">1:1 문의<i></i></a>
					</li>
					<li class='on'><a href="${ pageContext.request.contextPath }/question/myQuestionList.do">문의 내역
							확인<i></i></a></li>
				</ul>
			</div>
		</div>
		<h1>내 문의 내역</h1>

		<table class="ttbl">
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
			<tr>
				<td class="tit">담당 관리자</td>
				<td type="text" placeholder="" name="id" class="input_txt" maxlength="30" value="" required /td>
			</tr>
			<tr>
				<td class="tit">답변 내용</td>
				<td>${questionAnswer.content}</td>
			</tr>
		</table>
		<div class="fn1">
			<form:form name="questionDeleteFrm" action="${pageContext.request.contextPath}/question/deleteQuestion.do"
				method="post">
				<input type="hidden" name="no" value="${question.no}">
				<input type="submit" id="submit" value="문의 삭제" />
			</form:form>
		</div>
	</div>
</div>
</body>
</html>