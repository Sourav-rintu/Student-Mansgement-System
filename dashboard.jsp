<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP WEB APP</title>
<link rel="stylesheet" href="dashboard.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
<%@ page import="java.sql.*"%>
<div class="header">
	<div>
		<button onclick="location.href='dash.jsp'"><i class="fa-solid fa-house-user"></i></button>
		<button onclick="goBack()"><i class="fa-solid fa-angles-left"></i></button>
	</div>	
	<h1>Student <span>Evaluation </span></h1>
	<button onclick="toggle()">Add Students <i class="fa-solid fa-plus"></i></button>
</div>
<div class="details">
		<table>
			<thead>
				<tr>
					<th>RegNo</th>
					<th>Full Name</th>
					<th>Roll No</th>
					<th>Marks</th>
					<th>Update</th>
				</tr>
			</thead>
			<tbody>
				<%
					Class.forName("com.mysql.jdbc.Driver");
					String mySQLUser="root";
					String mySQLPwd="Sourav@24";
					String serverName="jdbc:mysql://localhost:3306/projectdb";
					Connection con = DriverManager.getConnection(serverName,mySQLUser,mySQLPwd);
					
					PreparedStatement ps=con.prepareStatement("SELECT * FROM details;");
					ResultSet rs=ps.executeQuery();
					int regno=0;
					String fullname="";
					String rollno="";
					String marks="";
					while(rs.next()){
						regno=rs.getInt(1);
						fullname=rs.getString(2);
						rollno=rs.getString(3);
						marks=rs.getString(7);
						
						
					%>
					<tr>
						<td><%=regno%></td>
						<td><%=fullname%></td>
						<td><%=rollno%></td>
						<td><%=marks%></td>
						<td>
							<a href="studentEdit.jsp?regno=<%=regno%>"><i class="fa-solid fa-pen-to-square"></i></a>
						</td>
					</tr>
					<%
				}
				%>
			</tbody>
		</table>
	</div>
<div class="popup" id="popup">
	<div class="title">
		<h2>Add Student Details</h2>
	</div>
	<form method="post" action="studentAdd.jsp">
		<div class="field">
			<label>Registration No.</label>
			<input type="number" name="regno" required>
		</div>
		<div class="field">
			<label>Full name</label>
			<input type="text" name="fullname" required>
		</div>
		<div class="field">
			<label>Roll Number</label>
			<input type="number" name="rollno" required>
		</div>
		<div class="field">
			<label>Mobile No</label>
			<input type="number" maxlength="10" name="mobile" required>
		</div>
		<div class="field">
			<label>Blood Group</label>
			<input type="text" name="blood" required>
		</div>
		<div class="field">
			<label>Gender</label>
			<select name="gender">
				<option value="" selected>Gender</option>
				<option value="Male" selected>Male</option>
				<option value="Female" selected>Female</option>
			</select>
		</div>
		<div class="field">
			<label>Department</label>
			<select name="department">
				<option value="" selected>Department</option>
				<option value="ECE" selected>ECE</option>
				<option value="IT" selected>IT</option>
			</select>
		</div>
		<div class="field">
			<label>Marks</label>
			<input type="number" name="marks" required>
		</div>
		<div class="action-field">
			<input type="submit" value="Add student ">
		</div>
	</form>
</div>
<script>
	window.onload=toggle();
	function toggle(){
		var popup=document.querySelector("#popup")
		if(popup.style.display=='none'){
			popup.style.display='block';
		}
		else{
			popup.style.display='none';
		}
	}
	function goBack() {
	      // Use the history object to navigate back
	    window.history.back();
	}
</script>
</body>
</html>