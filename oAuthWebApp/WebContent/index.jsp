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
    <input type="text" placeholder="Enter First Name" name="first_name">
    
    <label for="email"><b>Last Name</b></label>
    <input type="text" placeholder="Enter Last Name" name="last_name">
    
	<label for="email"><b>Full Name</b></label>
    <input type="text" placeholder="Enter Full Name" name="name">
    
    <label for="email"><b>Email Address</b></label>
    <input type="text" placeholder="Enter Email " name="emailAddress">
    
    <label for="email"><b>Birthday</b></label>
    <input type="text" placeholder="Enter Your Birthday" name="birthday">
    
    <label for="email"><b>Age range</b></label>
    <input type="text" placeholder="Enter Age Range" name="agerange">
    
    <label for="email"><b>Gender</b></label>
    <input type="text" placeholder="Enter Gender" name="gender">
    
    <label for="email"><b>Address</b></label>
    <input type="text" placeholder="Enter Address" name="hometownname">
   
    <label for="email"><b>Current Location</b></label>
    <input type="text" placeholder="Enter Location" name="locationname">
   
    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw">
	
    <label for="psw-repeat"><b>Repeat Password</b></label>
    <input type="password" placeholder="Repeat Password" name="psw-repeat" >
    
    <button type="submit" id="login" >Register</button>
    <button type="submit" id="fblogin" >Continue with Facebook<img src="img/fblogo.gif"></button>
  </div>

 
  <script>
  $( "#fblogin" ).click(function() {
	
	
	var oauthFBEndpoint = "https://www.facebook.com/dialog/oauth";
	var grantType = "code";
	var clientID = "281055615852932";
	var redirectURI = "https://localhost:8443/oAuthWebApp/Registration";
	var scope = "public_profile user_birthday user_gender email user_location user_hometown user_age_range";
	
	//Authorization request
	var request = oauthFBEndpoint+"?"+"response_type="+grantType+"&"+"client_id="+clientID+"&"+"redirect_uri="+encodeURIComponent(redirectURI)+"&"+"scope="+encodeURIComponent(scope);
	alert("You have Clicked Continue With FaceBook Button")	
    window.location.href = request;
    alert("You Can Get The Access Token")
    
  })
  </script>
  
</form> 
</body>
</html>