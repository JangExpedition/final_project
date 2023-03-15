<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head>

    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/main.css"/>
	<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" />
	<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css" /> 
	<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/layout.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/module.css?20211209" />
	<link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/customer.css" />
</head>


<body class="">

<div id="cgvwrap">
    
    

  	
	</div>

	<div id="contaniner"  class="">
        

		 <div id="contents" class="">
        

<div id="contents">

	<div class="cols-content">
		
<div class="col-aside">
    <h2>
        고객센터 메뉴</h2>
    <div class="snb">
        <ul>
            <li class='on'><a href="${ pageContext.request.contextPath }/faq/main.do">고객센터 메인<i></i></a></li>
            <li class=''><a href="${ pageContext.request.contextPath }/faq/faqList.do" title="현재선택">자주찾는 질문<i></i></a></li>
            <li class=''><a href="${ pageContext.request.contextPath }/notice/noticeList.do">공지/뉴스<i></i></a></li>
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
					<div class="c_qu">
                       
						    <a href="#none">현금영수증</a>                       
                        
						    <a href="#none">관람권</a>                       
                        
						    <a href="#none">예매</a>                       
                        
						    <a href="#none">환불</a>                       
                        
						    <a href="#none">취소</a>                       
                        
						    <a href="#none"></a>                       
                        
					</div>
				</div>
                <div class="c_box talk_inquiry" style="cursor:pointer;">
                    <strong class="c_tit">1:1 문의 이용</strong>
                    <span class="c_txt">1:1문의를 이용해보세요.</span>
                    <a href="javascript:;">문의하기</a>
                </div>
				<div class="c_box email_inquiry" style="cursor:pointer;">
					<strong class="c_tit">이메일 문의</strong>
					<span class="c_txt">24시간 365일 언제든지 문의해주세요.</span>
					<a href="/support/qna/default.aspx">문의하기</a>
                </div>
				<div class="c_box my_advice"  style="cursor:pointer;">
					<strong class="c_tit">내 상담 내역 확인</strong>
					<span class="c_txt">문의하신 내용을 확인하실 수 있습니다.</span>
					<a href="/user/mycgv/inquiry/qna/list.aspx?g=1#contaniner"  target="_blank" title="새창열기" >문의내역 조회</a>
                </div>
			</div>
			<div class="customer_notice_area">
				<div class="service_area">
					<span class="tit">자주찾는 서비스</span>
					<ul class="list">
						<li><a href="/user/mycgv/reserve/?g=1#contaniner" target="_blank" title="새창열기">신용카드<br/>영수증출력</a></li>
						<li><a href="/user/login/find-account.aspx"  target="_blank" title="새창열기">아이디/<br/>비밀번호 찾기</a></li>
						<li><a href="/user/mycgv/reserve/?g=1#contaniner"  target="_blank" title="새창열기">예매/<br/>취소내역 확인</a></li>
						<li><a href="/user/guest/default.aspx"  target="_blank" title="새창열기">비회원<br/>예매/취소</a></li>
						<li><a href="/user/mycgv/cjone-point/pointlist.aspx?g=1#contaniner"  target="_blank" title="새창열기">멤버십포인트<br/>사용안내</a></li>
						<li><a href="/user/mycgv/coupon/movie-ticket/list.aspx?g=1#contaniner"  target="_blank" title="새창열기">관람권<br/>할인쿠폰 등록</a></li>
					</ul>
				</div>
				<div class="notice_area">
                    <a href="${ pageContext.request.contextPath }/notice/noticeList.do">
					    <span class="tit">공지/뉴스</span>
                    </a>
					<a href="${pageContext.request.contextPath}/notice/noticeForm.do" class="more">공지/뉴스 더보기</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>