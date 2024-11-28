<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <%@ page isELIgnored="false" %>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Player Management</title>
    <link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">
    <script src="<c:url value='/resources/js/jquery-1.11.1.min.js' />"></script>
    <script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
</head>
<body>
<div class="container">
    <div class="col-md-offset-1 col-md-10">
        <h2>Player Management System</h2>
        <hr/>
        <input type="button" value="Add Player"
               onclick="window.location.href='showPlayerForm'; return false;"
               class="btn btn-primary"/>
        <br/><br/>
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="panel-title">
                    <c:choose>
                        <c:when test="${not empty teamId}">
                            Player List for Team ID: ${teamId}
                        </c:when>
                        <c:otherwise>
                            All Players List
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="panel-body">
                <table class="table table-striped table-bordered">
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Full Name</th>
                        <th>Position</th>
                        <th>Date of Birth</th>
                        <th>Nationality</th>
                        <th>Shirt Number</th>
                        <th>Team</th>
                        <th>Action</th>
                    </tr>
                    <!-- loop over and print our players -->
                    <c:forEach var="player" items="${players}">
                        <!-- construct an "update" link with player id -->
                        <c:url var="updateLink" value="/player/updateForm">
                            <c:param name="playerId" value="${player.id}" />
                            <!-- If there's a teamId, pass it to the update form -->
                            <c:if test="${not empty teamId}">
                                <c:param name="teamId" value="${teamId}" />
                            </c:if>
                        </c:url>
                        <!-- construct a "delete" link with player id -->
                        <c:url var="deleteLink" value="/player/delete">
                            <c:param name="playerId" value="${player.id}" />
                        </c:url>
                        <tr>
                            <td>${player.firstName}</td>
                            <td>${player.lastName}</td>
                            <td>${player.fullName}</td>
                            <td>${player.position}</td>
                            <td>${player.dateOfBirth}</td>
                            <td>${player.nationality}</td>
                            <td>${player.shirtNumber}</td>
                            <td>${player.team != null ? player.team.name : 'No Team'}</td>
                            <td>
                                <a href="${updateLink}">Update</a> |
                                <a href="${deleteLink}"
                                   onclick="if (!(confirm('Are you sure you want to delete this player?'))) return false">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </div>

    <!-- Hidden teamId field -->
        <c:if test="${not empty teamId}">
            <form:hidden path="teamId" value="${teamId}" />
        </c:if>
</div>
</body>
</html>