<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Spring MVC - Add Player</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</head>
<body>
    <div class="container">
        <div class="col-md-offset-2 col-md-7">
            <h2 class="text-center">Add Player</h2>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="panel-title">Player Form</div>
                </div>
                <div class="panel-body">
                    <!-- Form for Player -->
                    <form:form action="savePlayer" cssClass="form-horizontal" method="post" modelAttribute="player">
                        <!-- Player ID (hidden field) -->
                        <form:hidden path="id" />

                        <!-- First Name -->
                        <div class="form-group">
                            <label for="firstName" class="col-md-3 control-label">First Name</label>
                            <div class="col-md-9">
                                <form:input path="firstName" cssClass="form-control" />
                            </div>
                        </div>
                        <!-- Last Name -->
                        <div class="form-group">
                            <label for="lastName" class="col-md-3 control-label">Last Name</label>
                            <div class="col-md-9">
                                <form:input path="lastName" cssClass="form-control" />
                            </div>
                        </div>
                        <!-- Full Name -->
                        <div class="form-group">
                            <label for="fullName" class="col-md-3 control-label">Full Name</label>
                            <div class="col-md-9">
                                <form:input path="fullName" cssClass="form-control" />
                            </div>
                        </div>
                        <!-- Position -->
                        <div class="form-group">
                            <label for="position" class="col-md-3 control-label">Position</label>
                            <div class="col-md-9">
                                <form:input path="position" cssClass="form-control" />
                            </div>
                        </div>
                        <!-- Date of Birth -->
                        <div class="form-group">
                            <label for="dateOfBirth" class="col-md-3 control-label">Date of Birth</label>
                            <div class="col-md-9">
                                <form:input path="dateOfBirth" type="date" cssClass="form-control" />
                            </div>
                        </div>
                        <!-- Nationality -->
                        <div class="form-group">
                            <label for="nationality" class="col-md-3 control-label">Nationality</label>
                            <div class="col-md-9">
                                <form:input path="nationality" cssClass="form-control" />
                            </div>
                        </div>
                        <!-- Shirt Number -->
                        <div class="form-group">
                            <label for="shirtNumber" class="col-md-3 control-label">Shirt Number</label>
                            <div class="col-md-9">
                                <form:input path="shirtNumber" cssClass="form-control" />
                            </div>
                        </div>
                        <!-- Submit Button -->
                        <div class="form-group">
                            <div class="col-md-offset-3 col-md-9">
                                <form:button cssClass="btn btn-primary">Submit</form:button>
                            </div>
                        </div>
                    </form:form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>