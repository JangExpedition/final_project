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
    
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" />
	<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css" /> 
	<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/layout.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/module.css?20211209" />
	<link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/customer.css" />
  
</head>
<body>

<div id="contents">
  <div class="cols-content">
    <div class="col-aside">
	    <h2>고객센터 메뉴</h2>
	    <div class="snb">
	        <ul>
	            <li class=''><a href="${ pageContext.request.contextPath }/faq/main.do">고객센터 메인<i></i></a></li>
	            <li class=''><a href="${ pageContext.request.contextPath }/faq/faqList.do" title="현재선택">자주찾는 질문<i></i></a></li>
	            <li class='on'><a href="${ pageContext.request.contextPath }/notice/noticeList.do">공지/뉴스<i></i></a></li>      
	        </ul>
	    </div>
	</div>
		<div class="col-detail">
			<div class="customer_top">
				<h2 class="tit">자주찾는 질문</h2>
				<p class="stit">회원님들께서 가장 자주하시는 질문을 모았습니다. <br />궁금하신 내용에 대해 검색해보세요.</p>
			</div>
			<div class="board_view_area">
				<ul class="top_title_faq">
					<li class="title">${notice.classifyy.koreanNamee} ${notice.title}</li>
					<li class="stit_area">
						<span>등록일<em class="regist_day"><fmt:formatDate value="${createdAt}" pattern="yy-MM-dd HH:mm"/></em></span>
						<span class="check_tit_area">조회수<em class="check_num">${notice.readCount }</em></span>
					</li>
				</ul>
				<div class="view_area">
					<p>${notice.content}</p>
				</div>
				<a href="${pageContext.request.contextPath}/notice/noticeList.do"><div class="customer_btn"><button type="button" class="round inblack"  id="btn_list"><span>목록으로</span></button></div></a>
			</div>
		</div>
	</div>
</div>
</body>
</html>