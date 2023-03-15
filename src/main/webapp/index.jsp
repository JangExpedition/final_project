<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="영화 그 이상의 감동. J3L" name="title"/>

</jsp:include>
<!-- index.css -->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/index.css"/>
<div id="previewBox">
	<iframe width="980" height="489" 
	src="https://www.youtube.com/embed/enPPU3GCSEM?autoplay=1&mute=1" 
	title="YouTube video player" 
	frameborder="0" 
	allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
	allowfullscreen></iframe>
</div>


</body>
</html>