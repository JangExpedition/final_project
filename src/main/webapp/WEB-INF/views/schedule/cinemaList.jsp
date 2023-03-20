<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/memberList.css"/>

<div id="contents">
  <div class="cols-content">
		<div class="col-aside">
		    <h2>
		        고객센터 메뉴</h2>
		    <div class="snb">
		        <ul class="ul1">
		            <li class='on'><a href="${ pageContext.request.contextPath }/member/memberList.do">회원 관리<i></i></a></li>
		            <li class=''><a href="${ pageContext.request.contextPath }/movie/movieList.do">영화 관리<i></i></a></li>
		            <li class=''><a href="${ pageContext.request.contextPath }/question/questionList.do">문의 관리<i></i></a></li>
		            <li class=''><a href="${ pageContext.request.contextPath }/schedule/scheduleForm.do">상영 시간 관리<i></i></a></li>
		        </ul>
		    </div>
		</div>
		<div class="col-detail">
			<div class="customer_top">
				<h2 class="tit">회원 관리</h2>
			</div>
			
			<br>
			
			<form:form action="${pageContext.request.contextPath}/schedule/searchCinema" method="get" class="mb-3">
			  <div class="input-group">
			    <input type="hidden" name="searchType" value="name" />
			    <input type="text" class="form-control" id="myElement" placeholder="영화관  검색" aria-label="Recipient's username" aria-describedby="button-addon2" name="name" />
			    <button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
			  </div>
			</form:form>
			
			<div class="c_tab_wrap">
			</div>
			<div class="tbl_area">
				<table cellspacing="0" cellpadding="0" class="tbl_notice_list">
					<thead>
						<tr>
							<th scope="col">지점명</th>
		                    <th scope="col">주소</th>

						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cinemaList}" var="cinema">
	                        <tr>
							    <td>${cinema.name}</td>
	                            <td>${cinema.address}</td>
						    </tr>
	                     </c:forEach>   
					</tbody>	
				</table>
			</div>
		</div>
  	</div>
</div>	
</body>
</html>