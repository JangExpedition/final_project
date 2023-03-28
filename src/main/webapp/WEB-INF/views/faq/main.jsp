<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="/WEB-INF/views/common/header.jsp" />

<link rel="stylesheet" media="all" type="text/css" href="${ pageContext.request.contextPath }/resources/css/main.css" />

<div id="contaniner">
	<div id="contents">
		<div id="contents">
			<div class="cols-content">
				<div class="col-aside">
					<h2>
						고객센터 메뉴</h2>
					<div class="snb">
						<ul class="ul1">
							<li class='on'><a href="${ pageContext.request.contextPath }/faq/main.do">고객센터
									메인<i></i></a>
							</li>
							<li class=''><a href="${ pageContext.request.contextPath }/faq/faqList.do">자주찾는
									질문<i></i></a></li>
							<li class=''><a
									href="${ pageContext.request.contextPath }/notice/noticeList.do">공지/뉴스<i></i></a>
							</li>
							<li class=''><a href="${ pageContext.request.contextPath }/question/question.do">1:1
									문의<i></i></a></li>
							<li class=''><a href="${ pageContext.request.contextPath }/question/myQuestionList.do">문의
									내역 확인<i></i></a></li>
						</ul>
					</div>
				</div>

				<div class="col-detail">
					<div class="c_check_warp">
						<div class="c_box qna_search">
							<strong class="c_tit">자주찾는 질문 빠른검색</strong>
							</br>


							<form:form action="${pageContext.request.contextPath}/faq/searchFaq" method="get"
								class="mb-3">

								<legend><label for="searchtext">검색</label></legend>
								<div class="search_box">
									<input type="hidden" name="searchType" value="title" />
									<input type="text" class="form-control" id=myElement placeholder="검색어를 입력해주세요" 
										aria-label="Recipient's username" aria-describedby="button-addon2" name="title"/>
									<button type="submit" class="btn_search" id="btn_search">검색</button>
								</div>


								<div class="c_qu">
									<a href="${ pageContext.request.contextPath }/faq/searchFaq?searchType=title&title=현금영수증">현금영수증</a>
									<a href="${ pageContext.request.contextPath }/faq/searchFaq?searchType=title&title=관람권">관람권</a>
									<a href="${ pageContext.request.contextPath }/faq/searchFaq?searchType=title&title=예매">예매</a>
									<a href="${ pageContext.request.contextPath }/faq/searchFaq?searchType=title&title=환불">환불</a>
									<a href="${ pageContext.request.contextPath }/faq/searchFaq?searchType=title&title=취소">취소</a>
									<a href="#none"></a>

								</div>
							</form:form>
						</div>
						<div class="c_box talk_inquiry">
							<strong class="c_tit">1:1 문의 이용</strong>
							<span class="c_txt">1:1문의를 이용해보세요.</span>
							<a href="${pageContext.request.contextPath}/question/question.do">문의하기</a>
						</div>
						<div class="c_box my_advice">
							<strong class="c_tit">내 문의 내역 확인</strong>
							<span class="c_txt">문의하신 내용을 확인하실 수 있습니다.</span>
							<a href="${pageContext.request.contextPath}/question/myQuestionList.do">문의내역
								조회</a>
						</div>
					</div>
					<div class="customer_notice_area">
						<div class="service_area">
							<span class="tit">자주찾는 서비스</span>
							<ul class="list">
								<li><a href="" target="_blank" title="새창열기" class="list1"><br /></a></li>
								<li><a href="${pageContext.request.contextPath}/member/findId.do" target="_blank"
										title="새창열기" class="list1">아이디/<br />비밀번호 찾기</a></li>
								<li><a href="" target="_blank" title="새창열기" class="list1"><br /></a></li>
								<li><a href="" target="_blank" title="새창열기" class="list1"><br /></a></li>
							</ul>
						</div>
						<div class="notice_area">
							<a href="${ pageContext.request.contextPath }/notice/noticeList.do">
								<span class="tit">공지/뉴스</span>
							</a>
							<ul class="txt">
								<c:forEach var="notice" items="${noticeList}">
									<li><a
											href="${pageContext.request.contextPath}/notice/noticeDetail.do?no=${notice.no}">${notice.title}</a>
										<fmt:parseDate value="${notice.createdAt}" pattern="yyyy-MM-dd"
											var="createdAt" />
										<fmt:formatDate value="${createdAt}" pattern="yy/MM/dd" />
								</c:forEach>
							</ul>

							<a href="${pageContext.request.contextPath}/notice/noticeForm.do" class="more">공지/뉴스 더보기</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>

</html>









						<link rel="stylesheet" media="all" type="text/css"
							href="https://img.cgv.co.kr/R2014/css/module.css?20211209" />
						<link rel="stylesheet" media="all" type="text/css"
							href="http://img.cgv.co.kr/R2014/css/customer.css" />