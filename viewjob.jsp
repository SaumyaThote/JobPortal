<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


<style>

 .required input:after { 
 content:"*"; 
 }

.column {
  float: left;
  width: 33.33%;
  padding: 5px;
}
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
card{
	flex-wrap:wrap;
}
tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
<meta charset="UTF-8">
<title>Job detail</title>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

</head>

<body>

<div class="row">
 <div class="column">
  <div class="col-sm-6">
    <div class="card text-white bg-info mb-3" style="width: 27rem;">
      <div class="card-body">
        <h5 class="card-title">JOB DETAIL</h5>
         
       <c:forEach var="list" items="${list}">
          <form>
          
            <!-- Form One fields here -->
            <div class="form-group">
              <label for="exampleInputEmail1">Job ID</label>
              <input type="text" class="form-control" id="jobid" aria-describedby="emailHelp" placeholder="Job name" name="jobid" readonly="readonly" value="${list.jobid}">
            </div>
            
            <div class="form-group">
              <label for="exampleInputEmail1">Job Name</label>
              <input type="text" class="form-control" id="jobname" aria-describedby="emailHelp" placeholder="Job name" name="jobname" readonly="readonly" value="${list.jobname}">
            </div>
            
            <div class="form-group">
              <label for="exampleInputPassword1">Experience</label>
              <input type="text" class="form-control" id="jobexp" placeholder="Job Experience" name="jobexp" readonly="readonly" value="${list.jobexp}">
            </div>
            
             <div class="form-group">
              <label for="exampleInputPassword1">Package</label>
              <input type="text" class="form-control" id="jobpackage" placeholder="Job Package (ex: 0-2)" name="jobpackage"readonly="readonly" value="${list.jobpackage}">
            </div>
            
            <div class="form-group">
              <label for="exampleInputPassword1">Skill Require</label>
              <input type="text" class="form-control" id="jobskills" placeholder="Job Requirement" name="jobskills" readonly="readonly" value="${list.jobskills}">
            </div>
            
            <div class="form-group">
                <label>Select Job Type:</label>
                <div class="checkbox">
                    <input type="checkbox" id="onsite" name="jobtype" value="onsite" readonly="readonly" 
                    		<c:forEach var="c" items="${list.jobtype}">
								<c:if test="${c=='onsite'}">checked</c:if>
							</c:forEach>>
                    <label for="onsite">Onsite</label>
                    
                    <input type="checkbox" id="remote" name="jobtype" value="remote" readonly="readonly"
                   			<c:forEach var="c" items="${list.jobtype}">
								<c:if test="${c=='remote' }">checked</c:if>
							</c:forEach>>
                    <label for="remote">Remote</label>
                    
                     <input type="checkbox" id="hybrid" name="jobtype" value="hybrid" readonly="readonly"
                     	<c:forEach var="c" items="${list.jobtype}">
							<c:if test="${c=='hybrid' }">checked</c:if>
						</c:forEach>>
                    <label for="hybrid">Hybrid</label>
                </div>
            </div>
          </form>
          </c:forEach>
        </div>
       
      </div>
    </div>
  </div>
   <div class="column">
  <div class="col-sm-6" >
    <div class="card"  style="width: 55rem">
      <div class="card-body">
        <h5 class="card-title">JOB APPLICATION FORM</h5>
         <c:forEach var="list" items="${list}">
      <form action="apply" method="post" enctype="multipart/form-data">
            <!-- Form One fields here -->
            <div class="form-group">
              <label for="exampleInputEmail1">Job Id</label>
              <input type="text" class="form-control" id="jobid" aria-describedby="emailHelp"  name="jobid" value="${list.jobid}" readonly="readonly" style="background-color: gray;">
            </div>
            
            <div class="form-group">
              <label for="exampleInputEmail1">Job Name</label>
              <input type="text" class="form-control" id="jobname" aria-describedby="emailHelp"  name="jobname" value="${list.jobname}" readonly="readonly" style="background-color: gray;">
            </div>
            
            <div class="form-group">
              <label for="exampleInputEmail1">Full name</label>
              <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="name" placeholder="Enter your fullname" required="required">
            </div>
            
            <div class="form-group">
              <label for="exampleInputPassword1">Phone no.</label>
              <input type="text" class="form-control" id="phone" placeholder="Enter your phone no." name="phone" required="required">
            </div>
            
            <div class="mb-3">
  				<label for="formFile" class="form-label">Upload Resume</label>
  				<input class="form-control" type="file" id="resume" name="resume">
			</div>
          
            
            <button type="submit" class="btn btn-primary">Apply</button>
          </form>
          </c:forEach>
      </div>
      </div>
    </div>
  </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

</body>
</html>