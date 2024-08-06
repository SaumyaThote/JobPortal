<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Job opportunities</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script>
<style>
body{
  background-color: white;
}

table {
background-color:infobackground;
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
</head>
<body>

<c:set var="sesreg" value="${sesreg}"/>
<c:choose>
<c:when test="${sesreg=='success'}">
<script>
swal("Applied successfully!!!");</script>
</c:when>
</c:choose>
<c:remove  scope="session" var="sesreg"/>

<c:set var="sesaddjob" value="${sesaddjob}"/>
<c:choose>
<c:when test="${sesaddjob=='success'}">
<script>
swal("Job added successfully!!!");</script>
</c:when>
</c:choose>
<c:remove  scope="session" var="sesaddjob"/>


<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
    <a class="navbar-brand" href="#">
      
     Job opportunities
    </a>
  </nav>



<div class="container" style="padding: 20px">
<input id="myInput" type="text" placeholder="Search..">
<br><br>

<table>
  <thead>
  <tr>
    <th>JOB ID</th>
    <th>OPPOTUNITIES</th>
    <th>EXPERIENCE</th>
    <th>VIEW JOB</th>
  </tr>
  </thead>
  <tbody id="myTable">
  <c:forEach var="list" items="${list}">
  <tr>
    <td>${list.jobid}</td>
    <td>${list.jobname}</td>
    <td>${list.jobexp}</td>
    <td><a href="view/${list.jobid}" class="btn btn-info">View job</a> </td>
  </tr>
</c:forEach>
  </tbody>
</table>
  </div>

</body>
</html>