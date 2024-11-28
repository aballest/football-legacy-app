<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <%@ page isELIgnored="false" %>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Football Teams</title>
    <link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">
    <script src="<c:url value='/resources/js/jquery-1.11.1.min.js' />"></script>
    <script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
</head>
<body>
<div class="container">
    <div class="col-md-offset-1 col-md-10">
        <h2>Football Teams Management</h2>
        <hr />
        <input type="button" value="Add Team"
               onclick="window.location.href='showForm'; return false;"
               class="btn btn-primary" />
        <br/><br/>
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">Team List</div>
            </div>
            <div class="panel-body">
                <table class="table table-striped table-bordered">
                    <tr>
                        <th>Name</th>
                        <th>TLA</th>
                        <th>Stadium</th>
                        <th>Website</th>
                        <th>Founded</th>
                        <th>Action</th>
                    </tr>
                    <!-- Loop over and print our teams -->
                    <c:forEach var="team" items="${teams}">
                        <!-- Construct an "update" link with team id -->
                        <c:url var="updateLink" value="/team/updateForm">
                            <c:param name="teamId" value="${team.id}" />
                        </c:url>
                        <!-- Construct a "delete" link with team id -->
                        <c:url var="deleteLink" value="/team/delete">
                            <c:param name="teamId" value="${team.id}" />
                        </c:url>
                        <!-- Construct a "detail" link with team id -->
                        <c:url var="playerDetailLink" value="/player/listByTeam">
                            <c:param name="teamId" value="${team.id}" />
                        </c:url>
                        <tr>
                            <td>${team.name}</td>
                            <td>${team.tla}</td>
                            <td>${team.stadium}</td>
                            <td><a href="${team.website}" target="_blank">${team.website}</a></td>
                            <td>${team.founded}</td>
                            <td>
                                <!-- Display the update link -->
                                <a href="${updateLink}">Update</a> |
                                <a href="${deleteLink}"
                                   onclick="if (!(confirm('Are you sure you want to delete this team?'))) return false">Delete</a> |
                                <a href="${playerDetailLink}">Player Details</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>