<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="아이디/비밀번호 찾기<영화 그 이상의 감동. J3L" name="title"/>
</jsp:include>
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/findId.css"/>
<section id="findIdSection">
	<div id="findIdBox">
		<h4>아이디 찾기를 위한 본인인증 단계입니다.</h4>
		<br/>
		<img id="emailImg" src="${ pageContext.request.contextPath }/resources/images/email.png"/>
		<div id="step1" class="step">
			<input id="email" name="email" type="email" placeholder="이메일을 입력해주세요."/>
			<p id="emailErr" class="err"></p>
			<input id="authenticationBtn" value="이메일 인증" type="button" class="BtnStyle"/>
		</div>
		<div id="step2" class="step">
			<input id="authenticateCode" type="text" placeholder="인증코드 입력"/>
			<p id="authenticationErr" class="err"></p>
			<input id="authenticationCodeBtn" value="인증 확인" type="button" class="BtnStyle"/>
		</div>
		<div id="step3" class="step">
			<h4>회원님의 아이디는 <span id="resultId"></span>입니다.</h4>
		</div>
	</div>
</section>
<script>
let code = "";
let email = "";
const step1 = document.querySelector("#step1");
const step2 = document.querySelector("#step2");
const step3 = document.querySelector("#step3");

/* 인증코드 발송 메서드 */
document.querySelector("#authenticationBtn").addEventListener("click", (e)=>{
	e.preventDefault();
	
	email = document.querySelector("#email").value;
	const emailErr = document.querySelector("#emailErr");
	
	// 이메일 유효성 검사
	if (!/^[\w]{4,}@[\w]+(\.[\w]+){1,3}$/.test(email)) {
		emailErr.innerHTML = "유효하지 않는 이메일입니다.";
    	return false;
    };
    
    $.ajax({
    	url: "${pageContext.request.contextPath}/member/authentication.do?email=" + email,
    	success(data){
    		code = data;
    		step1.style.display = "none";
    		step2.style.display = "flex";
    	},
    	error: console.log
    });
	
});

/* 인증번호 확인 메서드 */
document.querySelector("#authenticationCodeBtn").addEventListener("click", (e)=>{
	const authenticateCode = document.querySelector("#authenticateCode").value;
	const authenticationErr = document.querySelector("#authenticationErr");
	if(authenticateCode != code){
		authenticationErr.innerHTML = "인증번호가 일치하지 않습니다. 다시 입력해주세요.";
	} else{
		
		findIdByEmail(email);
		
		step2.style.display = "none";
		step3.style.display = "flex";
	}
});

const findIdByEmail = (email) => {
	
	const csrfHeader = "${_csrf.headerName}";
	const csrfToken = "${_csrf.token}";
	const headers = {};
	headers[csrfHeader] = csrfToken;
	
	$.ajax({
		url: "${pageContext.request.contextPath}/member/findIdByEmail.do",
		method: "post",
		data: {email},
		headers,
		success(data){
			document.querySelector("#resultId").innerHTML = data;
		},
		error: console.log
	});
}
</script>
</body>
</html>