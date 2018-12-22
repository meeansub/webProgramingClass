<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="my" %>

<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${R}res/common.js"></script>
    <link rel="stylesheet" href="${R}res/common.css">
</head>
<body>
<div class="container">
    <h1>고객 목록</h1>
    <form:form method="get" modelAttribute="pagination" class="form-inline mb5">
        <form:hidden path="pg" value="1" />
        <span>순서:</span>
        <form:select path="ob" class="form-control autosubmit"
                     itemValue="value" itemLabel="label" items="${ orderBy }" />
        <form:select path="sb" class="form-control ml20"
                     itemValue="value" itemLabel="label" items="${ searchBy }" />
        <form:input path="st" class="form-control" placeholder="검색문자열" />
        <button type="submit" class="btn btn-default">
            <i class="glyphicon glyphicon-search"></i> 검색</button>
        <c:if test="${ pagination.sb > 0 || pagination.ob > 0}">
            <a class="btn btn-default" href="list7?pg=1">
                <i class="glyphicon glyphicon-ban-circle"></i> 검색취소</a>
        </c:if>
        <div class="pull-right">
            <span>페이지 크기:</span>
            <form:select path="sz" class="form-control autosubmit">
                <form:option value="10"/><form:option value="15"/><form:option value="30"/>
            </form:select>
        </div>
    </form:form>

    <table id="articles" class="table table-bordered">
        <thead>
        <tr>
            <th style="width:150px;">id</th>
            <th style="width:150px;">이름</th>
            <th style="width:150px;">직위</th>
            <th style="width:150px;">전화</th>
            <th style="width:150px;">도시</th>
            <th style="width:150px;">주문수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customers" items="${ list }">
            <tr>
                <td>${ customers.id }</td>
                <td>${ customers.firstName } ${ customers.lastName }</td>
                <td>${ customers.jobTitle}</td>
                <td>${ customers.businessPhone }</td>
                <td>${ customers.city }</td>
                <td>${ customers.orders.size()}</td>

            </tr>
        </c:forEach>
        </tbody>
    </table>
    <my:pagination pageSize="${ pagination.sz }" recordCount="${ pagination.recordCount }"
                   queryStringName="pg" />
</div>
</body>
</html>