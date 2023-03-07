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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/insertMember2.css"/>
<section id="insertMemberSection">
	<h1>회원가입</h1>
	<p id="enrollIntro">회원가입으로 혜택도 받고! 포인트도 쌓고!</p>
	<div id="duplicationCheck">
		<div>
			<h4>안전한 회원가입을 위한 본인인증 단계입니다.</h4>
			<br/>
			<img id="emailImg" src="${ pageContext.request.contextPath }/resources/images/email.png"/>
			<form id="authenticationFrm" name="authenticationFrm">
				<input name="email" type="email" placeholder="이메일을 입력해주세요." required/>
				<p id="emailErr" class="err"></p>
				<input id="authenticationBtn" value="이메일 인증" type="submit"/>
			</form>
		</div>
	</div>
</section>
<script>
document.authenticationFrm.addEventListener("submit", (e)=>{
	e.preventDefault();
	
	const email = e.target.email.value;
	const emailErr = document.querySelector("#emailErr");
	
	// 이메일 유효성 검사
	if (!/^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/.test(email)) {
		emailErr.innerHTML = "유효하지 않는 이메일입니다.";
    	return false;
    };
    
    $.ajax({
    	url: "${pageContext.request.contextPath}/member/authentication.do?email=" + email,
    	success(data){
    		console.log(data);
    	},
    	error: console.log
    });
	
});
</script>
</body>
</html>