<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Crypto Balance</title>
    <meta http-equiv="refresh" content="600">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css" />
    <link href="<c:url value='/static/assets/css/app.css' />" rel="stylesheet" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="<c:url value='/static/assets/css/app_second.css' />" rel="stylesheet" />
</head>

<body>
<c:import url="nav.jsp" />
<div class="container" style="width: 95%;text-align: center;">
    <c:forEach items="${portfolio}" var="summary" varStatus="iter">
        <c:if test="${iter.index == 0}">
            <c:set var = "lastExchange" scope = "request" value = "${summary.exchange}"/>
            <c:set var = "exchangeTotal" scope = "request" value = "${0}"/>
        </c:if>
        <c:if test="${lastExchange != summary.exchange}">
            <div class="col-a dollars">
                <label class="col-a-1 text-right width-10 mobile-width-30">
                    Total
                </label>
                <label class="col-a-1 text-right width-10 mobile-width-50">
                    <fmt:formatNumber maxFractionDigits="8" minFractionDigits="8" value="${exchangeTotal}" /> ₺
                </label>
            </div>
            <c:set var="lastExchange" value="${summary.exchange}"/>
            <c:set var="exchangeTotal" value="${0}"/>
            <hr class="break-line-red">
        </c:if>
        <c:set var="exchangeTotal" value="${exchangeTotal + summary.totalTL}"/>
        <div class="col-a dollars">
            <label class="col-a-1 hide-for-phone" style="width: 5%">
                ${summary.id}
            </label>
            <jsp:useBean id="myDate" class="java.util.Date"/>
            <c:set target="${myDate}" property="time" value="${summary.timestamp * 1000}"/>
            <label class="col-a-1 hide-for-phone width-10">
                @<fmt:formatDate value="${myDate}" pattern="dd-MM-yyyy HH:mm:ss"/>
            </label>
            <label class="col-a-1 width-5 mobile-width-48">
                    ${summary.exchange}
            </label>
            <label class="col-a-1 width-5 mobile-width-48">
                    ${summary.currency}
            </label>
            <label class="col-a-1 text-right width-10  mobile-width-48">
                <fmt:formatNumber maxFractionDigits="8" minFractionDigits="8" value="${summary.amount}" />
            </label>
            <label class="col-a-1 text-right width-10  mobile-width-48">
                <fmt:formatNumber maxFractionDigits="8" minFractionDigits="8" value="${summary.value}" />
            </label>
            <label class="col-a-1 text-right hide-for-phone width-10">
                <fmt:formatNumber maxFractionDigits="8" minFractionDigits="8" value="${summary.total}" />
            </label>
            <label class="col-a-1 text-right width-10">
                <fmt:formatNumber maxFractionDigits="8" minFractionDigits="8" value="${summary.totalTL}" /> ₺
            </label>
        </div>
        <hr class="break-line-gray">
    </c:forEach>
    <div class="col-a dollars">
        <label class="col-a-1 text-right width-10 mobile-width-30">
            Total
        </label>
        <label class="col-a-4 text-right width-10 mobile-width-48">
            <fmt:formatNumber maxFractionDigits="8" minFractionDigits="8" value="${exchangeTotal}" /> ₺
        </label>
    </div>
    <hr class="break-line-red">
</div>
<script src="//code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>
