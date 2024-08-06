<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
table {
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


<meta charset="UTF-8">
<title>Dashboard</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
   <style>
    body {
      background-color: #f0f0f0;
    }
    .sidebar {
      background-color: 0ba6ff;
      padding: 20px;
      color: #fff;
      width: 250px;
      height: 100vh;
      position: fixed;
      top: 56px; /* adjust top position to account for header height */
      left: 0;
    }
    .main-container {
      padding: 20px;
      margin-left: 250px;
      margin-top: 56px; /* adjust top margin to account for header height */
    }
    .form-one, .form-two {
      padding: 20px;
      border: 1px solid #ddd;
      background-color: #fff;
    }
  </style>
</head>
<body>
<c:set var="sesdel" value="${sesdel}"/>
<c:choose>
<c:when test="${sesdel=='success'}">
<script>
swal("Applicant deleted");</script>
</c:when>
</c:choose>
<c:remove  scope="session" var="sesdel"/>


   <!-- Header -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
    <a class="navbar-brand"> 
      DASHBOARD
    </a>
  </nav>

  <!-- Sidebar -->
  <div class="sidebar">
    <nav class="nav flex-column">
      <li class="nav-item">
        <a href="dashboard"class="btn btn-primary btn-block" id="btn-form-one">View Applicants</a>
      </li>
       </nav><br>
       <nav class="nav flex-column">
      <li class="nav-item">
        <button class="btn btn-primary btn-block" id="btn-form-two">Add Job</button>
      </li>
      </nav>
   
  </div>

  <!-- Main Container -->
  <div class="main-container">
    <div class="row">
      <div class="col-md-12">
        <div class="collapse" id="form-one">
          <h2>JOB SEEKER</h2>
<input id="myInput" type="text" placeholder="Search..">
<br><br>

<table>
  <thead>
  
  <tr>
  	
  	<th>JOB NAME</th>
    <th>FIRST NAME</th>
    <th>PHONE NO.</th>
    <th>RESUME</th>
    <th>DELETE</th>
  </tr>
  </thead>
  <tbody id="myTable">
  <c:forEach var="list" items="${list}">
  <tr>
  	
    <td>${list.jobname}</td>
    <td>${list.name}</td>
    <td>${list.phone}</td>
    <td>${list.filename}</td>
    <td><a class="btn btn-danger" href="delete/${list.id}">Delete</a></td>
  </tr>

</c:forEach>
  </tbody>
</table>
  </div>
        <div class="collapse" id="form-two">
         
         <h2>Add Job</h2>
          <form action="addjob" method="post">
            <!-- Form One fields here -->
            <div class="form-group">
              <label for="exampleInputEmail1">Job Name</label>
              <input type="text" class="form-control" id="jobname" aria-describedby="emailHelp" placeholder="Job name" name="jobname">
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Experience</label>
              <input type="text" class="form-control" id="jobexp" placeholder="Job Experience" name="jobexp">
            </div>
            
             <div class="form-group">
              <label for="exampleInputPassword1">Package</label>
              <input type="text" class="form-control" id="jobpackage" placeholder="Job Package" name="jobpackage">
            </div>
            <div class="form-group">
              <label for="exampleInputPassword1">Skill Require</label>
              <input type="text" class="form-control" id="jobskills" placeholder="Job Requirement" name="jobskills">
            </div>
            <div class="form-group">
                <label>Select Job Type:</label>
                <div class="checkbox">
                    <input type="checkbox" id="onsite" name="jobtype" value="onsite">
                    <label for="onsite">Onsite</label>
                    <input type="checkbox" id="remote" name="jobtype" value="remote">
                    <label for="remote">Remote</label>
                     <input type="checkbox" id="hybrid" name="jobtype" value="hybrid">
                    <label for="hybrid">Hybrid</label>
                </div>
            </div><br>          
            <button type="submit" class="btn btn-primary">Submit</button>
          </form>
        </div>
      </div>
    </div>
  </div>

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <script>
  	
    $(document).ready(function() {
    	$("#form-one").show();
		$("#form-two").hide();
    
      $('#btn-form-one').on('click', function() {
        $('#form-one').show();
        $('#form-two').hide();
      });
      $('#btn-form-two').on('click', function() {
        $('#form-two').show();
        $('#form-one').hide();
      });
    });
  </script>
  </body>
</html>


