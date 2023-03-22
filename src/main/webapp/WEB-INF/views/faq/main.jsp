<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" media="all" type="text/css" href="${ pageContext.request.contextPath }/resources/css/main.css"/>


<div id="contaniner">
  <div id="contents">
    <div id="contents">
	  <div class="cols-content">
	        <div class="col-aside">
			    <h2>
			        고객센터 메뉴</h2>
			    <div class="snb">
			        <ul class="ul1">
			            <li class='on'><a href="${ pageContext.request.contextPath }/faq/main.do">고객센터 메인<i></i></a></li>
			            <li class=''><a href="${ pageContext.request.contextPath }/faq/faqList.do">자주찾는 질문<i></i></a></li>
			            <li class=''><a href="${ pageContext.request.contextPath }/notice/noticeList.do">공지/뉴스<i></i></a></li>
			            <li class=''><a href="${ pageContext.request.contextPath }/question/question.do">1:1 문의<i></i></a></li>
			            <li class=''><a href="${ pageContext.request.contextPath }/question/myQuestionList.do">문의 내역 확인<i></i></a></li>
			        </ul>
			    </div>
			</div>

			<div class="col-detail">
					<div class="c_check_warp">
						<div class="c_box qna_search">
							<strong class="c_tit">자주찾는 질문 빠른검색</strong>
							</br>
							<legend><label for="searchtext">검색</label></legend>
							<form action="${pageContext.request.contextPath}/faq/searchFaq" method="get" class="mb-3">
							     <div class="input-group">
							       <input type="hidden" name="searchType" value="title" />
							       <input type="text" class="form-control" placeholder="질문 검색" aria-label="Recipient's username" aria-describedby="button-addon2" name="id" />
							       <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
							     </div>
		   					</form>
						</div>
	                <div class="c_box talk_inquiry">
	                    <strong class="c_tit">1:1 문의 이용</strong>
	                    <span class="c_txt">1:1문의를 이용해보세요.</span>
	                    <a href="${pageContext.request.contextPath}/question/question.do">문의하기</a>
	                </div>
					<div class="c_box my_advice">
						<strong class="c_tit">내 문의 내역 확인</strong>
						<span class="c_txt">문의하신 내용을 확인하실 수 있습니다.</span>
						<a href="${pageContext.request.contextPath}/question/myQuestionList.do">문의내역 조회</a>
	                </div>
				  </div>
				  <div class="customer_notice_area">
						<div class="service_area">
							<span class="tit">자주찾는 서비스</span>
							<ul class="list">
								<li><a href="" target="_blank" title="새창열기" class="list1">신용카드<br/>영수증출력</a></li>
								<li><a href="${pageContext.request.contextPath}/member/findId.do"  target="_blank" title="새창열기" class="list1">아이디/<br/>비밀번호 찾기</a></li>
								<li><a href=""  target="_blank" title="새창열기" class="list1">예매/<br/>취소내역 확인</a></li>
								<li><a href=""  target="_blank" title="새창열기" class="list1">비회원<br/>예매/취소</a></li>
								<li><a href=""  target="_blank" title="새창열기" class="list1">멤버십포인트<br/>사용안내</a></li>
								<li><a href=""  target="_blank" title="새창열기" class="list1">관람권<br/>할인쿠폰 등록</a></li>
							</ul>
						</div>
						<div class="notice_area">
	                    <a href="${ pageContext.request.contextPath }/notice/noticeList.do">
						    <span class="tit">공지/뉴스</span>
						</a>
						    <ul class="txt">
                    
                            <li><a href="${pageContext.request.contextPath}/notice/noticeDetail.do?no=85">[점검] 2023년 3월 시스템 점검 안내</a><span class="day">2023.03.16</span></li>
                        
                            <li><a href="${pageContext.request.contextPath}/notice/noticeDetail.do?no=86">[기타] 개인정보처리방침 개정 안내 (1/16 字 시행)</a><span class="day">2023.03.16</span></li>
                        
                            <li><a href="${pageContext.request.contextPath}/notice/noticeDetail.do?no=87">[기타] 23년 VIP 선정 기준 일부 변경 안내 (VIP점수, 조기승급)</a><span class="day">2023.01.09</span></li>
                        
                            <li><a href="/support/news/detail-view.aspx?idx=7935&type=1">[시스템점검] 2023년 1월 시스템 점검 안내</a><span class="day">2022.12.29</span></li>
                        
                            <li><a href="/support/news/detail-view.aspx?idx=7934&type=3"> 2022 SVIP 스페셜기프트 언박싱 이벤트 진행 일정 변경 안내</a><span class="day">2022.12.19</span></li>
                        
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






<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/module.css?20211209" />
<link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/customer.css" />