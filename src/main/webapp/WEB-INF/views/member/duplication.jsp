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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/duplication.css"/>
<section id="duplicationSection">
	<div id="duplicationCheck">
		<h2><span id="pointColor">${ member.name }</span>님! 이미 J3L 회원으로 등록되어 있습니다.</h2>
		<p id="enrollIntro">회원 아이디(${ member.id })로 로그인 하시거나 아이디 찾기를 진행해 주세요.</p>
		<div id="findIdOrLogin">
			<a href="${ pageContext.request.contextPath }/member/findId.do"><div>아이디 찾기</div></a>
			<a href="${ pageContext.request.contextPath }/member/memberLogin.do"><div>로그인</div></a>
		</div>
	</div>
</section>
</body>
</html>