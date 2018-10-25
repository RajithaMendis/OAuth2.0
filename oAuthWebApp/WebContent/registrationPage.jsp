<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Account</title>
<script src="js/jquery-2.2.4.min.js"></script>

<style>
label {
    width:180px;
    clear:left;
    text-align:right;
    padding-right:10px;
}

input, label {
    float:left;
	margin-bottom:10px;
}
#login{
    background-color: #4cafa6;
    border: none;
    color: black;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
	position: absolute;
    left: 50px;
    top: 550px;
}

#fblogin{
    background-color: #4c97af;
    border: none;
    color: black;
    padding: 15px 32px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
	position: absolute;
    left: 200px;
    top: 550px;
}
</style>
</head>
<body>



<form action="Registration" method="GET">
 <!--  <form action="action_page.php">-->
  <div class="container">
    <h1>Register</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>

    <label for="email"><b>First Name</b></label>
    <input type="text" placeholder="Enter First Name" name="first_name" value="<%= request.getAttribute("first_name") %>" >
    
    <label for="email"><b>Last Name</b></label>
    <input type="text" placeholder="Enter Last Name" name="last_name" value="<%= request.getAttribute("last_name") %>" >
    
	<label for="email"><b>Full Name</b></label>
    <input type="text" placeholder="Enter Full Name" name="name" value="<%= request.getAttribute("name") %>" >
    
    <label for="email"><b>Email Address</b></label>
    <input type="text" placeholder="Enter Email " name="emailAddress" value="<%= request.getAttribute("emailAddress") %>" >
    
    <label for="email"><b>Birthday</b></label>
    <input type="text" placeholder="Enter Your Birthday" name="birthday" value="<%= request.getAttribute("birthday") %>" >
    
    <label for="email"><b>Age range</b></label>
    <input type="text" placeholder="Enter Age Range" name="agerange" value="<%= request.getAttribute("agerange") %>" >
    
    <label for="email"><b>Gender</b></label>
    <input type="text" placeholder="Enter Gender" name="gender" value="<%= request.getAttribute("gender") %>" >
    
    <label for="email"><b>Address</b></label>
    <input type="text" placeholder="Enter Address" name="hometownname" value="<%= request.getAttribute("hometownname") %>" >
    
    <label for="email"><b>Current Location</b></label>
    <input type="text" placeholder="Enter Location" name="locationname" value="<%= request.getAttribute("locationname") %>" >
    
    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" value="<%= request.getAttribute("pwd") %>" >
    
    <label for="psw-repeat"><b>Repeat Password</b></label>
    <input type="password" placeholder="Repeat Password" name="psw-repeat" value="<%= request.getAttribute("pwd") %>" >
    
    <button type="submit" id="login" >Register</button>
    <button type="submit" id="fblogin" >Continue with Facebook<img src="img/fblogo.gif"></button>
  </div>

 <script>
  $( "#login" ).click(function() {
	alert("You Have Successfully LoggedIn ")
  })
  </script>
  
</form> 
</body>
</html>