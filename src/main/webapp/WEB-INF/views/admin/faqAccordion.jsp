<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>eclipse.buildId=4.17.2.202301310704
java.version=17.0.6
java.vendor=Eclipse Adoptium
BootLoader constants: OS=macosx, ARCH=aarch64, WS=cocoa, NL=ko_KR
Framework arguments:  -product org.springframework.boot.ide.branding.sts4 -keyring /Users/jung-incheol/.eclipse_keyring
Command-line arguments:  -os macosx -ws cocoa -arch aarch64 -product org.springframework.boot.ide.branding.sts4 -keyring /Users/jung-incheol/.eclipse_keyring

This is a continuation of log file /Users/jung-incheol/Desktop/kh/spring_workspace/sts4/.metadata/.bak_0.log
Created Time: 2023-02-28 10:19:01.956

org.eclipse.m2e.logback.appender
Warning
Wed Mar 01 17:33:01 KST 2023
Using platform encoding (UTF-8 actually) to copy filtered resources, i.e. build is platform dependent!


<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/faqArc.css"/>

<br><br><br>
<div class="faq-header">FAQ</div>


<%-- <a herf="<%= request.getContextPath()%>/faq/faqAccordion"><div class="faq-header">로그인 정보</div> </a> --%>

<div class="faq-content">
  <div class="faq-question">
    <input id="q1" type="checkbox" class="panel">
    <div class="plus">+</div>
    <label for="q1" class="panel-title">(로그인/정보) 회원 정보 수정은 어디서 하나요?</label>
    <div class="panel-content"> 우측 상단 회원 정보 클릭 뒤, My Page에서 이용 가능합니다. </div>
  </div>
  
  <div class="faq-question">
    <input id="q2" type="checkbox" class="panel">
    <div class="plus">+</div>
    <label for="q2" class="panel-title">(로그인/정보) 비회원은 게시판을 이용할 수 없나요? </label>
    <div class="panel-content"> 게시판 서비스는 회원 대상을 중심으로 이용 가능합니다. </div>
  </div>
  
  <div class="faq-question">
    <input id="q3" type="checkbox" class="panel">
    <div class="plus">+</div>
    <label for="q3" class="panel-title">(로그인/정보) 로그인시 탈퇴된 회원이라고 떠요</label>
    <div class="panel-content"> 해당 회원은 블랙리스트에 추가되어 강제 탈퇴 처리된 회원입니다. </div>
  </div>
  
  <div class="faq-question">
    <input id="q4" type="checkbox" class="panel">
    <div class="plus">+</div>
    <label for="q4" class="panel-title">(서비스 이용) 이상한 회원을 발견했어요</label>
    <div class="panel-content"> 게시글 하단에 신고하기 버튼을 통해 신고해주세요. </div>
  </div>
  
  <div class="faq-question">
    <input id="q5" type="checkbox" class="panel">
    <div class="plus">+</div>
    <label for="q5" class="panel-title">(서비스 이용) 내가 작성한 글 목록을 확인하고 싶어요</label>
    <div class="panel-content"> 우측 상단 회원 정보 클릭 뒤, My Page -> list 탭에서 이용 가능합니다. </div>
  </div>
  
  <div class="faq-question">
    <input id="q6" type="checkbox" class="panel">
    <div class="plus">+</div>
    <label for="q6" class="panel-title"> (서비스 이용) 내가 좋아요를 누른 게시물을 확인하고 싶어요 </label>
    <div class="panel-content"> 우측 상단 회원 정보 클릭 뒤, My Page -> like 탭에서 이용 가능합니다. </div>
  </div>
  
  <div class="faq-question">
    <input id="q7" type="checkbox" class="panel">
    <div class="plus">+</div>
    <label for="q7" class="panel-title"> (서비스 이용) 옷 나눔을 하고/받고 싶어요 </label>
    <div class="panel-content"> share 게시판을 이용해주세요. </div>
  </div>

	<div class="faq-question">
	    <input id="q8" type="checkbox" class="panel">
	    <div class="plus">+</div>
	    <label for="q8" class="panel-title">(기타) 문의사항이 있어요 </label>
	    <div class="panel-content"> 페이지 좌측 하단 INFO 게시판을 이용해주세요. 빠르게 답변해드리겠습니다.</div>
	</div>
	
	<br><br><br><br>

</div>



<%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>