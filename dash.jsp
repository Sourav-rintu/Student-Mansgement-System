<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP WEB APP</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Poppins');
*{
    padding: 0px;
    margin: 0px;
    box-sizing: border-box;
    font-family: Poppins;
}

.header
{
    width: 100%;
    padding: 0px 5%;
    height: 60px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    background: whitesmoke;
    box-shadow: 0px 0px 10px black;
}
.header span{
	color:royalblue;
}
.header a{
	padding:8px 18px;
	background:royalblue;
	color:white;
	outline:none;
	border:none;
	text-decoration:none;
	border-radius:5px;
	font-size:15px;
	cursor:pointer;
}
body{
	height:80vh;
	background:url('https://png.pngtree.com/thumb_back/fw800/background/20230519/pngtree-books-and-notebooks-image_2605328.jpg');
	background-position:relative;
	background-size:cover;
	background-repeat:no-repeat;
	
}
.evaluate a{
	position:absolute;
	top:50%;
	left:50%;
	transform:translate(-50%,-50%);
	padding:15px 35px;
	background:#008ECC;
	color:white;
	font-size:17px;
	text-decoration:none;
	border:none;
	border-radius:5px;
	cursor:pointer;
}
</style>
</head>
    <%
        HttpSession ss = request.getSession();
        Object user = ss.getAttribute("user");
        String username="";
        if(user != null)
        {
            username = user.toString();
        }
        else
        {
            response.sendRedirect("dashboard.jsp");
        }
    %>

    <div class="header">
        <h2>Welcome | <span><%=username %></span></h2>
        <a href = "logout.jsp">Logout <i class="fa-solid fa-arrow-right-from-bracket"></i></a>
    </div>
    
<body>
	<div class="evaluate" >
		<a href = "dashboard.jsp">Evaluate Students</a>
	</div>
</body>
</html>