<!DOCTYPE HTML>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="locale" var="loc"/>
<html lang="${language}">
<head>
    <head>
        <title>Account</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4-4.1.1/jq-3.3.1/dt-1.10.18/sl-1.2.6/datatables.min.css"/>
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="../css/customfood.css">
        <link rel="stylesheet" type="text/css" href="../css/style.css">


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/v/bs4-4.1.1/jq-3.3.1/dt-1.10.18/sl-1.2.6/datatables.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<header class='crono-header crono-header--home'>
    <div class='main-wrap'>
        <div class='row clearfix'>
            <div class='crono-header_logo column'>
                <a href='#'>
                    <img src='images/logo-getfit.png' width='150' height='65' alt='Cronometer.com' />
                </a>
            </div>
            <nav class='nav--top column clearfix'>
                <ul>
                    <li class="nav--top_item">
                        <form>
                            <select id="language" name="language" onchange="submit()">
                                <option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
                                <option value="ru" ${language == 'ru' ? 'selected' : ''}>Russian</option>
                            </select>
                        </form>
                    </li>
                    <li id="loginli" class='nav--top_item nav--top_item--login popup-trigger' data-popup='crono-popup--login'>
                        <div class="dropdown">
                            <p class="accountOptions-btn" style="cursor: pointer;" onclick="viewAccountOptions()"><fmt:message key="HELLO" bundle="${loc}"/> <c:out value="${user.firstName}"/></p>
                            <div id="accountOptions" class="dropdown-content">
                                <form action="index" method="post">
                                    <div class="logout-btn">
                                        <input type="submit" value="<fmt:message key="LOGOUT" bundle="${loc}"/>">
                                    </div>
                                    <input type="hidden" name="command" value="logout">
                                </form>
                            </div>
                        </div>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</header>
<div class="container">
    <form class="form-horizontal" role="form" action="account" method="post">
        <h2><fmt:message key="ADD_FOODS" bundle="${loc}"/></h2>
        <h4 style="padding-left: 75px;"><fmt:message key="ADD_FOODS.condition" bundle="${loc}"/></h4>
        <div class="form-group">
            <label for="name" class="col-sm-3 control-label"><fmt:message key="NAME" bundle="${loc}"/></label>
            <div class="col-sm-9">
                <input type="text" id="name" name="name" placeholder="<fmt:message key="NAME" bundle="${loc}"/>" class="form-control" autofocus required>
            </div>
        </div>
        <div class="form-group">
            <label for="fat" class="col-sm-3 control-label"><fmt:message key="FAT" bundle="${loc}"/></label>
            <div class="col-sm-9">
                <input type="text" id="fat" name="fat" placeholder="<fmt:message key="FAT.placeholder" bundle="${loc}"/>" class="form-control" autofocus required>
            </div>
        </div>
        <div class="form-group">
            <label for="protein" class="col-sm-3 control-label"><fmt:message key="PROTEIN" bundle="${loc}"/></label>
            <div class="col-sm-9">
                <input type="text" id="protein" name="protein" placeholder="<fmt:message key="PROTEIN.placeholder" bundle="${loc}"/>" class="form-control" required>
            </div>
        </div>
        <div class="form-group">
            <label for="carb" class="col-sm-3 control-label"><fmt:message key="CARB" bundle="${loc}"/></label>
            <div class="col-sm-9">
                <input type="text" id="carb" name="carb" placeholder="<fmt:message key="CARB.placeholder" bundle="${loc}"/>" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label for="calories" class="col-sm-3 control-label"><fmt:message key="CALORIES" bundle="${loc}"/></label>
            <div class="col-sm-9">
                <input type="text" id="calories" name = "calories" placeholder="<fmt:message key="CALORIES.placeholder" bundle="${loc}"/>" class="form-control" required>
            </div>
        </div>
        <div>
            <a href="account?command=goToPage&url=WEB-INF%2Faccount.jsp">
            <input type="button" class="btn btn-primary btn-block" style="background-color: #ab1313; border-color: #a11313;" value="<fmt:message key="CANCEL" bundle="${loc}"/>">
            </a>
            <button type="submit" class="btn btn-primary btn-block"><fmt:message key="CONFIRM" bundle="${loc}"/></button>
            <input type="hidden" name="command" value="addFood">
        </div>

    </form> <!-- /form -->
</div> <!-- ./container -->
</body>
</html>
