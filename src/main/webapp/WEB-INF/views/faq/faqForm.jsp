<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/faqForm.css"/>


<div id="contaniner">
	<div id="contents">
		<div class="cols-content">
			<div class="col-aside">
				<h2>
					고객센터 메뉴</h2>
				<div class="snb">
					<ul class="ul1">
						<li class=''><a href="${ pageContext.request.contextPath }/faq/main.do">고객센터 메인<i></i></a></li>
						<li class='on'><a href="${ pageContext.request.contextPath }/faq/faqList.do" title="현재선택">자주찾는 질문<i></i></a></li>
						<li class=''><a href="${ pageContext.request.contextPath }/notice/noticeList.do">공지/뉴스<i></i></a>
						</li>
						<sec:authorize access="hasRole('ROLE_USER')"> 
						<li class=''><a href="${ pageContext.request.contextPath }/question/question.do">1:1 문의</a></li>
						<li class=''><a href="${ pageContext.request.contextPath }/question/myQuestionList.do">문의 내역 확인</a></li>
						</sec:authorize> 
					</ul>
				</div>
			</div>
			
			<div class="customer_top">
				<h2 class="tit">자주찾는 질문 작성</h2>
			</div>
			
			<form:form name="faqFrm" action="${pageContext.request.contextPath}/faq/faqEnroll.do" method="post">
				<input type="hidden" id="hIsTemp" name="hIsTemp" value="N" />
				<input type="hidden" id="hIdx" name="hIdx" value="" />
				<fieldset>
					<div class="tbl_area">
						<table cellspacing="0" cellpadding="0" class="tbl_notice_list tbl_left">
 							<colgroup>
								<col style="width:96px" />
								<col style="width:303px" />
								<col style="width:96px" />
								<col style="width:303px" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row"><label for="inp_title">제목</label></th>
									<td colspan="3">
										<input type="text" id="title" name="title" class="inp01"
											style="width: 672px;" />
									</td>
								</tr>

								<tr>
									<th scope="row">구분</th>
									<td colspan="3">
										<select class="form-select" name="classify">
											<option value="YEME">예매 관련</option>
											<option value="HAWNBULL">환불 관련</option>
											<option value="HOEWON">회원 관련</option>
											<option value="BUNSILMOOL">분실물 관련</option>
											<option value="GITA">기타</option>
										</select>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="inp_textbox">내용 <em><img
													src="${ pageContext.request.contextPath }/resources/images/ico_redstar.png" /></em></label>
									</th>
									<td colspan="3">
										<textarea id="content" name="content"
											class="inp_txtbox01"></textarea>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="box-btn qna_email">
						<div class="parent">
							<input type="submit" value="등록" />
						</div>
					</div>
				</fieldset>
			</form:form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>