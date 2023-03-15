<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<head>

    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/noticeList.css"/>
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/webfont.css" />
	<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/reset.css" /> 
	<link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/layout.css" />
    <link rel="stylesheet" media="all" type="text/css" href="https://img.cgv.co.kr/R2014/css/module.css?20211209" />
	<link rel="stylesheet" media="all" type="text/css" href="http://img.cgv.co.kr/R2014/css/customer.css" />
    
</head>
<body>
   

<div id="contaniner">
  <div id="contents">
	<div class="cols-content">
		<div class="col-aside">
		    <h2>
		        고객센터 메뉴</h2>
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
				<h2 class="tit">공지/뉴스</h2>
				<p class="stit">CGV의 주요한 이슈 및 여러가지 소식들을 확인하실 수 있습니다.</p>
			</div>
			
			<br>
			
			<form:form action="${pageContext.request.contextPath}/notice/searchNotice" method="get" class="mb-3">
			  <div class="input-group">
			    <input type="hidden" name="searchType" value="title" />
			    <input type="text" class="form-control" id="myElement" style="max-width: 200px;" placeholder="제목 검색" aria-label="Recipient's username" aria-describedby="button-addon2" name="title" />
			    <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
			  </div>
			</form:form>
			<input type="button" value="글쓰기" id="btn-add" class="btn btn-outline-success"/>
			<div class="c_tab_wrap">
			
			<div class="qu_txt">
				
					<em>추천검색어 :</em>
                    
                            <span class='first'> <a href="#none" >현금영수증</a></span>
                        
                            <span class=''> <a href="#none" >관람권</a></span>
                        
                            <span class=''> <a href="#none" >예매</a></span>
                        
                            <span class=''> <a href="#none" >환불</a></span>
                        
                            <span class=''> <a href="#none" >취소</a></span>
                        
                            <span class=''> <a href="#none" ></a></span>
                        
				</div>
			</div>
			<div class="tbl_area">
				<table cellspacing="0" cellpadding="0" class="tbl_notice_list">
 				<caption>목록</caption>
				<colgroup>
					<col style="width:40px;" />
                    <col style="width:120px;" />
					<col style="width:560px;" />
					<col style="auto" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
	                    <th scope="col">구분</th>
						<th scope="col">제목</th>
 						<th scope="col">등록일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${noticeList}" var="notice">
                        <tr data-no="${notice.no}">
						    <td>${notice.no }</td>
                            <td>${notice.classifyy.koreanNamee}</td>
						    <td>${notice.title}</td>
						    <td>
								<fmt:formatDate value="${faq.createdAt}" pattern="yy-MM-dd HH:mm"/>
								<fmt:parseDate value="${faq.createdAt}" pattern="yyyy-MM-dd'T'HH:mm" var="createdAt"/>
							</td>
					    </tr>
                     </c:forEach>   
				</tbody>	
				</table>
			</div>
			<div class="search_order">
				<ol>
				<li><span class="ico_oder find_q">자주찾는 질문 검색</span></li>
 				<!-- <li><span class="ico_oder email_i"> 더욱 자세한 답변을 원할시 </span><a href="/support/qna/default.aspx"><img src="http://img.cgv.co.kr/support/faq/btn_inquiry.png" alt="문의" /></a></li> -->
                <li style="text-align: left;"><span class="ico_oder tel_i">고객센터 전화문의</span><span class="num">1544-1122<br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(상담가능 시간, 월~금 09:00~18:00)</span></li>
				</ol>
			</div>
		</div>
	</div>
  </div>
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