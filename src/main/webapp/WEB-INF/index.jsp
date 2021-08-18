<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="/main.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
	<title>Registration & Login</title>	
</head>
<body>
<div class = "container-sm mx-auto mt-5">
<h4 class ="text-danger">${ notAllowed }</h4>
	<div class="card text-white bg-secondary mb-3" style="max-width: 50rem;">
			<div class="card-header"> Register </div>
				<div class="card-body">
					<h5 class="card-title">Get Started...</h5>
					<form:form action="/register" method="post" modelAttribute="newUser">
        				<div class="form-group">
            				<label>User Name:</label>
            				<form:input path="userName" class="form-control" />
           				 	<form:errors path="userName" class="text-warning" />
        				</div>
        				<div class="form-group">
           				 	<label>Email:</label>
            				<form:input path="email" class="form-control" />
           					<form:errors path="email" class="text-warning" />
        				</div>
        				<div class="form-group">
            				<label>Password:</label>
            				<form:password path="password" class="form-control" />
            				<form:errors path="password" class="text-warning" />
       				 	</div>
        				<div class="form-group">
            				<label>Confirm Password:</label>
            				<form:password path="confirm" class="form-control" />
            				<form:errors path="confirm" class="text-warning" />
        				</div>
        				<input type="submit" value="Register" class="btn btn-primary my-3" />
    			</form:form>			
			</div><!-- close card body -->
		</div><!-- close card -->	
	<div class="card text-white bg-secondary mb-3" style="max-width: 50rem;">
  		<div class="card-header">Login</div>
  			<div class="card-body bg-light">
  				<h5 class="card-title text-dark">Welcome Back!</h5>
  				 <form:form action="/login" method="post" modelAttribute="newLogin">
  				 <div class="form-group text-dark">
            		<label>Email:</label>
            		<form:input path="email" class="form-control" />
            		<form:errors path="email" class="text-warning" />
        		</div>
        		<div class="form-group text-dark">
            		<label>Password:</label>
            		<form:password path="password" class="form-control" />
            		<form:errors path="password" class="text-warning" />
        		</div>
        	<input type="submit" value="Login" class="btn btn-success my-3" />
    		</form:form>	
			</div><!-- close card body -->
		</div><!-- close card -->
 	</div><!-- close container -->
</body>
</html>