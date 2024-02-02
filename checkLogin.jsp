<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import ="java.sql.*"%>

<%

	String username = request.getParameter("username");
	String pwd = request.getParameter("pwd");
	
	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb", "root", "Sourav@24");
	String sql = "SELECT * FROM login WHERE Username=? and Password=?";
	
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setString(1, username);
	ps.setString(2, pwd);
	
	ResultSet rs = ps.executeQuery();
	
	if(rs.next())
	{
		
			HttpSession ss=request.getSession();
			ss.setAttribute("user",username);
			
			Cookie userCookie=new Cookie("username",username);
			userCookie.setMaxAge(48*60*60);
			response.addCookie(userCookie);
			
			Cookie passwordCookie=new Cookie("password",pwd);;
			passwordCookie.setMaxAge(48*60*60);
			response.addCookie(passwordCookie);
			
			response.sendRedirect("dash.jsp");
			
			
	
	}else{
		%>
		<script>
			alert("Login failed !!");
			window.location.href="http://localhost:8080/project4/login.jsp";
		</script>
		<%
	}
	

%>
