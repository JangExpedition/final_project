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

<banner>
  <div class="video-banner">
    <video autoplay muted controls>
      <source src="https://adimg.cgv.co.kr/images/202207/BulletTrain/0812_BulletTrain_1080x608.mp4" type="video/mp4">
    </video>
  </div>
</banner>
</body>
</html>