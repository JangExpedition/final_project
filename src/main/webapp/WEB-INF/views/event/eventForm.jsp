<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/eventForm.css"/>


<div id="contaniner">
	<div id="contents">
		<div class="cols-content">
			<div class="customer_top">
				<h2 class="tit">이벤트 게시물 작성</h2>
			</div>

			<form:form name="eventFrm"
				action="${pageContext.request.contextPath}/event/eventEnroll.do?${_csrf.parameterName}=${_csrf.token}"
				method="POST" enctype="multipart/form-data">
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
										<input type="text" id="title" name="title" class="inp01" />
									</td>
								</tr>

								<tr>
									<th scope="row">구분</th>
									<td colspan="3">
										<select class="form-select" name="category">
											<option value="SPECIAL">스페셜</option>
											<option value="MOVIEYEME">영화/예매</option>
											<option value="MEMBERSHIP">멤버십</option>
											<option value="JAEHYUSALE">제휴/할인</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="tit">첨부파일</td>
									<td colspan="3">
										<input type="file" name="upFile" id="upFile" multiple>
									</td>
								</tr>
								<tr>
									<th scope="row"><label for="inp_textbox">내용 <em><img
													src="${ pageContext.request.contextPath }/resources/images/ico_redstar.png" /></em></label>
									</th>
									<td colspan="3">
										<textarea id="content" name="content" class="inp_txtbox01"></textarea>
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
</body>

</html>