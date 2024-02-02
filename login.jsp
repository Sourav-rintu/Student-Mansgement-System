<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Login | Session Management</title>
	<link rel="stylesheet" href="login.css">
</head>


<body>
<%	
	String username="",pwd="";
	HttpSession ss=request.getSession();
	Object user=ss.getAttribute("user");
	if(user!=null)
	{
		response.sendRedirect("dash.jsp");
	}else{
		Cookie cookies[]=request.getCookies();
		for(int i=0;i<cookies.length;i++){
			if(cookies[i].getName().equals("username")){
				username=cookies[i].getValue();
			}
			if(cookies[i].getName().equals("password")){
				pwd=cookies[i].getValue();	
			}
		}
	}
%>
	<div class="login">
		<form  action="checkLogin.jsp" method="post">
			<h2>Login</h2>
			<input type="email" name="username" value="<%=username%>" required placeholder="username">
			<input type="password" name="pwd" value=""<%=pwd%> required placeholder="password">
			<input type="submit" value="Login">
		</form>

	</div>
<body>

</body>
</html>