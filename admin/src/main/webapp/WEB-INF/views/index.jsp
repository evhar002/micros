<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Crypto Balance History</title>
    <meta http-equiv="refresh" content="600">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
    <link href="<c:url value='/static/assets/css/app.css' />" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="<c:url value='/static/assets/css/app_second.css' />" rel="stylesheet" />
</head>

<body>
<c:import url="nav.jsp" />
<div class="container">
    <c:forEach items="${portfolio}" var="summary">
        <div class="col-a dollars">
            <jsp:useBean id="myDate" class="java.util.Date"/>
            <c:set target="${myDate}" property="time" value="${summary.timestamp * 1000}"/>
            <label class="col-a-3">
                @<fmt:formatDate value="${myDate}" pattern="dd-MM-yyyy HH:mm:ss"/>
            </label>
            <label class="col-a-3 text-right">
                <fmt:formatNumber maxFractionDigits="4" minFractionDigits="4" value="${summary.value}" /> ₺
            </label>
        </div>
    </c:forEach>
    <hr>
</div>
<script src="//code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>
