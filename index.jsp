<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>Home Page</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <style>
    body {
      background-image: url('https://images.unsplash.com/photo-1522202176988-66273c2fd55f?q=80&w=2071&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'); 
      
      background-size: cover;
      background-position: center;
      height: 100vh;
      margin: 0;
    }
   .container {
      text-align: center;
      padding-top: 20vh;
    }
   .btn {
      margin: 20px;
      border: 10px;
      padding: 40px;
    }
  </style>
</head>
<body>
  <div class="container">
   
    <a  href="dashboard"class="btn btn-primary btn-lg">ADMIN</a>
    <a  href="joblist"class="btn btn-secondary btn-lg">JOBS</a>
  </div>
</body>
</html>