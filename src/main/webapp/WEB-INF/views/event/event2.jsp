<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="극장|영화 그 이상의 감동. J3L" name="title" />
</jsp:include>

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/css/event2.css" />


<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>CGV Events</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <header>
    <div class="logo">
      <img src="logo.png" alt="CGV logo">
    </div>
    <nav>
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">Events</a></li>
        <li><a href="#">Theaters</a></li>
        <li><a href="#">Membership</a></li>
        <li><a href="#">FAQ</a></li>
      </ul>
    </nav>
  </header>
  <main>
    <div class="event-banner">
      <img src="event-banner.jpg" alt="Event banner">
      <h1>CGV Events</h1>
      <button>Learn More</button>
    </div>
    <div class="event-list">
      <div class="event-item">
        <img src="event-1.jpg" alt="Event 1">
        <h2>Event 1</h2>
        <p>May 1 - May 10, 2023</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod nulla non magna facilisis, eu ultrices mi viverra. Fusce vel ipsum urna.</p>
      </div>
      <div class="event-item">
        <img src="event-2.jpg" alt="Event 2">
        <h2>Event 2</h2>
        <p>June 1 - June 10, 2023</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod nulla non magna facilisis, eu ultrices mi viverra. Fusce vel ipsum urna.</p>
      </div>
      <div class="event-item">
        <img src="event-3.jpg" alt="Event 3">
        <h2>Event 3</h2>
        <p>July 1 - July 10, 2023</p>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod nulla
         </div>
  <div class="event-item">
    <img src="event-4.jpg" alt="Event 4">
    <h2>Event 4</h2>
    <p>August 1 - August 10, 2023</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod nulla non magna facilisis, eu ultrices mi viverra. Fusce vel ipsum urna.</p>
  </div>
  <div class="event-item">
    <img src="event-5.jpg" alt="Event 5">
    <h2>Event 5</h2>
    <p>September 1 - September 10, 2023</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod nulla non magna facilisis, eu ultrices mi viverra. Fusce vel ipsum urna.</p>
  </div>
  <div class="event-item">
    <img src="event-6.jpg" alt="Event 6">
    <h2>Event 6</h2>
    <p>October 1 - October 10, 2023</p>
    <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed euismod nulla non magna facilisis, eu ultrices mi viverra. Fusce vel ipsum urna.</p>
  </div>
</div>
<div class="pagination">
  <button>&lt;&lt;</button>
  <button>&lt;</button>
  <span>1</span>
  <button>2</button>
  <button>3</button>
  <button>&gt;</button>
  <button>&gt;&gt;</button>
</div>