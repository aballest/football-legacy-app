<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Team Management - Add or Edit Team</title>
<link href="<c:url value='/resources/css/bootstrap.min.css' />" rel="stylesheet">
<script src="<c:url value='/resources/js/jquery-1.11.1.min.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
</head>
<body>
 <div class="container">
  <div class="col-md-offset-2 col-md-7">
   <h2 class="text-center">Add or Edit Team</h2>
   <div class="panel panel-info">
    <div class="panel-heading">
     <div class="panel-title">Team Form</div>
    </div>
    <div class="panel-body">
     <form:form action="saveTeam" cssClass="form-horizontal" method="post" modelAttribute="team">

      <!-- Hidden input for team ID -->
      <form:hidden path="id" />

      <div class="form-group">
       <label for="name" class="col-md-3 control-label">Name</label>
       <div class="col-md-9">
        <form:input path="name" cssClass="form-control" />
       </div>
      </div>

      <div class="form-group">
       <label for="tla" class="col-md-3 control-label">TLA</label>
       <div class="col-md-9">
        <form:input path="tla" cssClass="form-control" />
       </div>
      </div>

      <div class="form-group">
       <label for="stadium" class="col-md-3 control-label">Stadium</label>
       <div class="col-md-9">
        <form:input path="stadium" cssClass="form-control" />
       </div>
      </div>

      <div class="form-group">
       <label for="website" class="col-md-3 control-label">Website</label>
       <div class="col-md-9">
        <form:input path="website" cssClass="form-control" />
       </div>
      </div>

      <div class="form-group">
       <label for="founded" class="col-md-3 control-label">Founded</label>
       <div class="col-md-9">
        <form:input path="founded" cssClass="form-control" type="number" />
       </div>
      </div>

      <div class="form-group">
       <!-- Submit Button -->
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