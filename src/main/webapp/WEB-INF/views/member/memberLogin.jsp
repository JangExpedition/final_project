<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="영화 그 이상의 감동. J3L" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/memberLogin.css"/>
<section class="login-body">
	<div class="login-wrapper">
		<div class="selectMode">
			<div class="menu on">
				로그인
			</div>
			<div class="menu">
				비회원 예매
			</div>
			<div class="menu">
				비회원 예매확인
			</div>
		</div>
		<div class="login-box">
			<form:form action="${ pageContext.request.contextPath }/member/memberLogin.do" id="loginFrm" name="loginFrm" method="POST">
				<fieldset>
					<p>아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</p>
					<input class="loginInput" type="text" name="id"/>
					<input class="loginInput" type="password" name="password"/>
					<button class="loginSubmit">
						<div>로그인</div>
					</button>
					<div class="saveOrFindIdBox">
						<input type="checkbox" id="remember-me" name="remember-me"/>
						<label for="remember-me" id="saveIdLabel">자동 로그인</label>
						<a href="${ pageContext.request.contextPath }/member/findId.do">아이디 찾기</a>
						<a href="${ pageContext.request.contextPath }/member/findPassword.do">비밀번호 찾기</a>
					</div>
				</fieldset>
			</form:form>
		</div>
	</div>
</section>
</body>
</html>