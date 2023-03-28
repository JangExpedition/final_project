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
					<li class='on'><a href="${ pageContext.request.contextPath }/faq/faqList.do">자주찾는 질문<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/notice/noticeList.do">공지/뉴스<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/question/question.do">1:1 문의<i></i></a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/question/myQuestionList.do">문의 내역 확인<i></i></a></li>
				</ul>
			</div>
		</div>
		<div class="col-detail">
			<div class="customer_top">
				<h2 class="tit">자주찾는 질문</h2>
				<p class="stit">회원님들께서 가장 자주하시는 질문을 모았습니다.
			</div>

			<br>

			<form:form action="${pageContext.request.contextPath}/faq/searchFaq" method="get" class="mb-3">
				<div class="input-group">
					<input type="hidden" name="searchType" value="title" />
					<input type="text" class="form-control" id="myElement" placeholder="검색어를 입력해주세요"
						aria-label="Recipient's username" aria-describedby="button-addon2" name="title" />
					<button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
					<div class="qu_txt">

					<em>추천검색어 :</em>

					<span class='first'> <a
							href="${ pageContext.request.contextPath }/faq/searchFaq?searchType=title&title=현금영수증">현금영수증</a></span>

					<span class=''> <a
							href="${ pageContext.request.contextPath }/faq/searchFaq?searchType=title&title=관람권">관람권</a></span>

					<span class=''> <a
							href="${ pageContext.request.contextPath }/faq/searchFaq?searchType=title&title=예매">예매</a></span>

					<span class=''> <a
							href="${ pageContext.request.contextPath }/faq/searchFaq?searchType=title&title=환불">환불</a></span>

					<span class=''> <a
							href="${ pageContext.request.contextPath }/faq/searchFaq?searchType=title&title=취소">취소</a></span>

					<span class=''> <a href="#none"></a></span>

				</div>
				</div>
			</form:form>




			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<div class="parent">
					<a href="#" id="btn-add">글쓰기</a>
				</div>
			</sec:authorize>


			<div class="c_tab_wrap2">

				
			</div>
			<div class="c_tab_wrap">
				<ul class="c_tab type_free">
					<li class='on'><a href="${ pageContext.request.contextPath }/faq/faqList.do"
							 title="선택된 탭메뉴">전체</a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/faq/searchFaq?searchType=title&title=예매"
							>예매/매표</a></li>
					<li class=''><a
							href="${ pageContext.request.contextPath }/faq/searchFaq?searchType=title&title=결제수단"
							>결제 수단</a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/faq/searchFaq?searchType=title&title=할인"
							>할인 혜택</a></li>
					<li class=''><a href="${ pageContext.request.contextPath }/faq/searchFaq?searchType=title&title=영화관"
							>영화관 이용</a></li>
					<li class=''><a
							href="${ pageContext.request.contextPath }/faq/searchFaq?searchType=title&title=홈페이지"
							>홈페이지</a></li>

				</ul>
			</div>
			<div class="tbl_area">
				<table class="tbl_notice_list">
					<thead>
						<tr>
							<th class="col">번호</th>
							<th class="col">구분</th>
							<th class="col">제목</th>
							<th class="col">등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${faqList}" var="faq">
							<tr data-no="${faq.no}">
								<td>${faq.no }</td>
								<td>${faq.classify.koreanName}</td>
								<td>${faq.title}</td>
								<td>
									<fmt:parseDate value="${faq.createdAt}" pattern="yyyy-MM-dd" var="createdAt" />
									<fmt:formatDate value="${createdAt}" pattern="yy/MM/dd" />
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
	document.querySelector("#btn-add").addEventListener('click', (e) => {
		location.href = '${pageContext.request.contextPath}/faq/faqForm.do';
	});

	document.querySelectorAll("tr[data-no]").forEach((tr) => {
		tr.addEventListener('click', (e) => {
			const no = tr.dataset.no;
			console.log(no);
			location.href = '${pageContext.request.contextPath}/faq/faqDetail.do?no=' + no;
		});
	});
</script>


</body>
</html>