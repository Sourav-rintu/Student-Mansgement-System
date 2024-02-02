<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP WEB APP</title>
<link rel="stylesheet" href="studentEdit.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<%@ page import="java.sql.*"%>
<%
	int regno;
	regno=Integer.parseInt(request.getParameter("regno"));
	Class.forName("com.mysql.jdbc.Driver");
	String mySQLUser="root";
	String mySQLPwd="Sourav@24";
	String serverName="jdbc:mysql://localhost:3306/projectdb";
	Connection con = DriverManager.getConnection(serverName,mySQLUser,mySQLPwd);
	
	PreparedStatement ps=con.prepareStatement(" select * from details WHERE Regno=?;");
	ps.setInt(1,regno);
	ResultSet rs=ps.executeQuery();
	String fullname="";
	String rollno="";
	String blood="";
	String gender="";
	String department="";
	String marks="";
	
	
	if(rs.next()){
		fullname=rs.getString(2);
		rollno=rs.getString(3);
		blood=rs.getString(4);
		gender=rs.getString(5);
		department=rs.getString(6);
		marks=rs.getString(7);
		
	}
	ps.close();
	con.close();
	
%>
<div class="header">
	<h1><span>Update</span> Student Details</h1>
</div>

<div class="popup" id="popup">
	<div class="title">
		<h2>Update Student</h2>
	</div>
	<form method="post" action="studentupdate.jsp">
		<div class="field">
			<label>Registration No.</label>
			<input type="number" name="regno" value="<%=regno%>" required readonly>
		</div>
		<div class="field">
			<label>Fullname</label>
			<input type="text" name="fullname" value="<%=fullname%>" required>
		</div>
		<div class="field">
			<label>Roll No</label>
			<input type="text" name="rollno" value="<%=rollno%>"required>
		</div>
		<div class="field">
			<label>Blood Group</label>
			<input type="text" name="blood" value="<%=blood%>"required>
		</div>
		<div class="field">
			<label>Gender</label>
			<input type="text" name="gender" value="<%=gender%>">
		</div>
		<div class="field">
			<label>Department</label>
			<input type="text" name="department" value="<%=department%>">
		</div>
		<div class="textarea-field">
			<label>Marks</label>
			<input type="text" name="marks" value="<%=marks%>">
		</div>
		<div class="action-field">
			<input type="submit" value="Update Student">
		</div>
	</form>
</div>

</body>
</html>