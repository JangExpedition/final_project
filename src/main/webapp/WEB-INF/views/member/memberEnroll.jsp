<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원가입<회원서비스|영화 그 이상의 감동. J3L" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/memberEnroll.css"/>
	<section id="enrollSection">
		<img id="enrollImg" src="${ pageContext.request.contextPath }/resources/images/memberEnroll.jpeg">
		<p id="introEnroll">J3L의 회원이 되시면 J3L의 다양한 서비스를 이용하실 수 있습니다.</p>
		<a href="${ pageContext.request.contextPath }/member/insertMember.do">
			<div id="enrollBtn">
				회원가입
			</div>
		</a>
	</section>
</body>
</html>