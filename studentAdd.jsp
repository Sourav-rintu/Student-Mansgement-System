<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

    
<%@page import="java.sql.*"%>
<%
	int regno;
	String fullname,rollno,blood,gender,department,marks;
	regno=Integer.parseInt(request.getParameter("regno"));
	fullname=request.getParameter("fullname");
	rollno=request.getParameter("rollno");
	blood=request.getParameter("blood");
	gender=request.getParameter("gender");
	department=request.getParameter("department");
	marks=request.getParameter("marks");
	
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","Sourav@24");
	String sql="INSERT INTO details VALUES(?,?,?,?,?,?,?);";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setInt(1,regno);
	ps.setString(2,fullname);
	ps.setString(3,rollno);
	ps.setString(4,blood);
	ps.setString(5,gender);
	ps.setString(6,department);
	ps.setString(7,marks);
	
	
	ps.executeUpdate();ps.close();con.close();
%>
<script>
	alert('Student Registration Successfull !!')
</script>
<%
	response.sendRedirect("dashboard.jsp");
%>		
	