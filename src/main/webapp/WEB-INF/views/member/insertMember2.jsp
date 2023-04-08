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
			<form:form id="step3" name="enrollFrm" class="step" action="${ pageContext.request.contextPath }/member/enroll.do" method="post">
				<input name="id" type="text" placeholder="4글자 이상 12글자 이하의 숫자, 영문자의 아이디를 입력해주세요."/>
				<p id="idErr" class="err"></p>
				<input name="password" type="password" placeholder="비밀번호를 입력해주세요."/>
				<p id="passwordErr" class="err"></p>
				<input name="passwordCheck" type="password" placeholder="비밀번호를 다시 한번 입력해주세요."/>
				<p id="passwordCheckErr" class="err"></p>
				<input name="name" type="text" value="${ member.name }" readonly/>
				<input name="phone" type="text" value="${ member.phone }" readonly/>
				<input name="email" type="hidden" value=""/>
				<input name="birth" type="text" value="${ member.birth }" readonly/>
				<input name="age" type="hidden" value=""/>
				<input id="enrollBtn" value="회원가입" type="submit" class="BtnStyle"/>
			</form:form>
		</div>
	</div>
</section>
<script>
let code = "";
const step1 = document.querySelector("#step1");
const step2 = document.querySelector("#step2");

/* 인증코드 발송 메서드 */
document.querySelector("#authenticationBtn").addEventListener("click", (e)=>{
	e.preventDefault();
	
	const email = document.querySelector("#email").value;
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
    		document.enrollFrm.email.value = email;
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
		step2.style.display = "none";
		step3.style.display = "flex";
	}
});

/* 회원가입 유효성 검사 */
document.enrollFrm.addEventListener("submit", (e)=>{
	e.preventDefault();
	
	const id = e.target.id.value;
	const password = e.target.password.value;
	const passwordCheck = e.target.passwordCheck.value;
	const birth = e.target.birth.value;
	const idErr = document.querySelector("#idErr");
	const passwordError = document.querySelector("#passwordErr");
	const passwordCheckError = document.querySelector("#passwordCheckError");
	
	/* 아이디 유효성 검사 */
	if(!/^[A-Za-z0-9]{4,12}$/.test(id)){
		idErr.innerHTML = "사용할 수 없는 닉네임입니다.";
		return false;
	}
	
	/* 아이디 중복검사 */
	const isOK = overlapId(id); 
	console.log(isOK);
	if(isOK !== "true"){
		idErr.innerHTML = "이미 사용중인 아이디 입니다.";
		return false;
	}
	
	/* 비밀번호 유효성 검사 */
	// 숫자 검사
    if(!/\d/.test(password)){
    	passwordError.innerHTML = "비밀번호는 하나 이상의 숫자를 반드시 포함해야 합니다.";
        return false;
    }
    
    // 문자 검사
    if(!/[a-zㅏ-ㅣㄱ-ㅎ]/i.test(password)){
    	passwordError.innerHTML = "비밀번호는 하나 이상의 문자를 반드시 포함해야 합니다.";
    	return false;
    }
    
    // 특수문자 검사
    if(!/[!@#$%^&*()]/.test(password)){
    	passwordError.innerHTML = "비밀번호는 하나 이상의 특수문자를 반드시 포함해야 합니다.";
    	return false;
    }
	
	if(!/^[a-zㅏ-ㅣㄱ-ㅎ0-9!@#$%^&*()]{4,}$/i.test(password)){
		passwordError.innerHTML = "비밀번호는 영문자/숫자/특수문자로 구성된 4글자이상이어야합니다.";
		return false;
	}
	
	if(password !== passwordCheck){
		passwordCheckError.innerHTML = "비밀번호가 일치하지 않습니다.";
		return false;
	}
	
	e.target.age.value = calAge(birth);
	
	e.target.submit();
 });
 
 /* 만 나이 검사 메서드 */
const calAge = (birth) => {
	 const today = new Date();
	 
	 const birthYear = Number(birth.substring(0,4));
	 const birthMonth = Number(birth.substring(4,6));
	 const birthDate = Number(birth.substring(6));
	 
	 const birthday = new Date(birthYear, birthMonth - 1, birthDate);
	
	 let age = today.getFullYear() - birthday.getFullYear();
	 const m = today.getMonth() - birthday.getMonth();
	 if (m < 0 || (m === 0 && today.getDate() < birthday.getDate())) {
	     age--;
	 }
	 
	 return age;
 }
 
 /* 아이디 중복검사 메서드 */
 const overlapId = (id) => {
	 
	 let result;
	 
	 $.ajax({
			url: "${pageContext.request.contextPath}/member/overlapId.do",
			data: {id},
			async : false,
			success(data){
				console.log(data, typeof data);
				result = data;
			},
			error: console.log
		});
	 
	 return result;
	 
 }
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>