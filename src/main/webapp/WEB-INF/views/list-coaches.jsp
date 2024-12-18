<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <%@ page isELIgnored="false" %>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>javaguides.net</title>
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery-1.11.1.min.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</head>
<body>
    <div class="container">
        <div class="col-md-offset-1 col-md-10">
            <h2>CRM - Coach Relationship Manager</h2>
            <hr />
            <input type="button" value="Add Coach" onclick="window.location.href='showForm'; return false;" class="btn btn-primary" />
            <br/><br/>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <div class="panel-title">Coach List</div>
                </div>
                <div class="panel-body">
                    <table class="table table-striped table-bordered">
                        <tr>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Full Name</th>
                            <th>Date of Birth</th>
                            <th>Nationality</th>
                            <th>Team</th>
                            <th>Action</th>
                        </tr>
                        <!-- loop over and print our coaches -->
                        <c:forEach var="tempCoach" items="${coaches}">
                            <!-- construct an "update" link with coach id -->
                            <c:url var="updateLink" value="/coach/updateForm">
                                <c:param name="coachId" value="${tempCoach.id}" />
                            </c:url>
                            <!-- construct an "delete" link with coach id -->
                            <c:url var="deleteLink" value="/coach/delete">
                                <c:param name="coachId" value="${tempCoach.id}" />
                            </c:url>
                            <tr>
                                <td>${tempCoach.firstName}</td>
                                <td>${tempCoach.lastName}</td>
                                <td>${tempCoach.fullName}</td>
                                <td>${tempCoach.dateOfBirth}</td>
                                <td>${tempCoach.nationality}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty tempCoach.team}">
                                            ${tempCoach.team.name}
                                        </c:when>
                                        <c:otherwise>
                                            No Team
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <!-- display the update link -->
                                    <a href="${updateLink}">Update</a> |
                                    <a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this coach?'))) return false">Delete</a>
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