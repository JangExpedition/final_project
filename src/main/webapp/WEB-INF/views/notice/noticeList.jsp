<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/noticeList.css"/>
   
<div id="contaniner">
	<div id="contents">
		<div class="cols-content">
			<div class="col-aside">
				<h2>
					고객센터 메뉴</h2>
				<div class="snb">
					<ul class="ul1">
						<li class=''><a href="${ pageContext.request.contextPath }/faq/main.do">고객센터 메인<i></i></a></li>
						<li class=''><a href="${ pageContext.request.contextPath }/faq/faqList.do" title="현재선택">자주찾는 질문<i></i></a></li>
						<li class='on'><a href="${ pageContext.request.contextPath }/notice/noticeList.do">공지/뉴스<i></i></a></li>
						<li class=''><a href="${ pageContext.request.contextPath }/question/question.do">1:1 문의<i></i></a></li>
						<li class=''><a href="${ pageContext.request.contextPath }/question/myQuestionList.do">문의 내역 확인<i></i></a></li>
					</ul>
				</div>
			</div>

			<div class="col-detail">
				<div class="customer_top">
					<h2 class="tit">공지/뉴스</h2>
					<p class="stit">J3L의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</p>
				</div>

				<br>

				<form:form action="${pageContext.request.contextPath}/notice/searchNotice" method="get" class="mb-3">
				    <div class="input-group">
				        <select name="searchType" id="selsearchfield" class="c_select">
				            <option value="title" ${param.searchType == 'title' ? 'selected' : ''}>제목</option>
				            <option value="content" ${param.searchType == 'content' ? 'selected' : ''}>내용</option>
				        </select>
				        <input type="text" class="form-control" id="myElement" placeholder="검색어를 입력하세요"
				               aria-label="Recipient's username" aria-describedby="button-addon2" name="keyword" value="${param.keyword}">
				        <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
				    </div>
				</form:form>

				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<div class="parent">
						<a href="#" id="btn-add">글쓰기</a>
					</div>
				</sec:authorize>

				<div class="c_tab_wrap">
					<ul class="c_tab type_free">
						<li class='on'><a href="${ pageContext.request.contextPath }/notice/noticeList.do"
								title="선택된 탭메뉴">전체</a></li>
						<li class=''><a
								href="${ pageContext.request.contextPath }/notice/searchNotice?searchType=title&keyword=점검">시스템점검</a>
						</li>
						<li class=''><a
								href="${ pageContext.request.contextPath }/notice/searchNotice?searchType=title&keyword=극장">극장</a>
						</li>
						<li class=''><a
								href="${ pageContext.request.contextPath }/notice/searchNotice?searchType=title&keyword=행사">행사/이벤트</a>
						</li>
						<li class=''><a
								href="${ pageContext.request.contextPath }/notice/searchNotice?searchType=title&keyword=제휴">제휴이벤트</a>
						</li>
						<li class=''><a
								href="${ pageContext.request.contextPath }/notice/searchNotice?searchType=title&keyword=기타">기타</a>
						</li>
					</ul>
				</div>

				<div class="tbl_area">
					<table cellspacing="0" cellpadding="0" class="tbl_notice_list">
						<thead>
							<tr>
								<th class="col">번호</th>
								<th class="col">구분</th>
								<th class="col">제목</th>
								<th class="col">등록일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${noticeList}" var="notice">
								<tr data-no="${notice.no}">
									<td>${notice.no }</td>
									<td>${notice.classifyy.koreanNamee}</td>
									<td>${notice.title}</td>
									<td>
										<fmt:parseDate value="${notice.createdAt}" pattern="yyyy-MM-dd"
											var="createdAt" />
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
</div>

<%-- 페이지 번호 계산 --%>
<c:set var="currentPage" value="${not empty param.page ? param.page : 1}"/>
<c:set var="pageSize" value="${5}"/>
<c:set var="startPage" value="${(currentPage - 1) / 10 * 10 + 1}"/>
<c:set var="endPage" value="${(startPage + 5) > totalPages ? totalPages : (startPage + 5)}"/>

<%-- 페이지 링크 생성 --%>
<c:url var="prevPageLink" value="/notice/noticeList.do">
    <c:param name="page" value="${currentPage - 1}"/>
</c:url>

<c:url var="nextPageLink" value="/notice/noticeList.do">
    <c:param name="page" value="${currentPage + 1}"/>
</c:url>

<c:url var="lastPageLink" value="/notice/noticeList.do">
    <c:param name="page" value="${totalPages}"/>
</c:url>	

<%-- 페이지 링크 표시 --%>
<div class="contentss">
    <c:if test="${currentPage > 1}">
        <a class="btn-paging prev" href="${prevPageLink}">이전</a>
    </c:if>

    <c:forEach var="page" begin="${startPage}" end="${endPage}">
    <c:url var="pageLink" value="/notice/noticeList.do">
        <c:param name="page" value="${page}"/>
    </c:url>

    <c:choose>
        <c:when  test="${page == currentPage}">
            <b class="first">${page}</b>
        </c:when>
        <c:otherwise>
            <a class="number" href="${pageLink}">${page}</a>
        </c:otherwise>
    </c:choose>
</c:forEach>

    <c:if test="${currentPage < totalPages}">
        <a href="${nextPageLink}" class="btn-paging next" >다음</a>
    </c:if>

    <c:if test="${currentPage != totalPages}">
        <a href="${lastPageLink}" class="btn-paging end" >마지막</a>
    </c:if>
</div>

<script>
	document.querySelector("#btn-add").addEventListener('click', (e) => {
		location.href = '${pageContext.request.contextPath}/notice/noticeForm.do';
	});

	document.querySelectorAll("tr[data-no]").forEach((tr) => {
		tr.addEventListener('click', (e) => {
			const no = tr.dataset.no;
			console.log(no);
			location.href = '${pageContext.request.contextPath}/notice/noticeDetail.do?no=' + no;
		});
	});
</script>
</body>
</html>