<%@ page language="java" import="java.sql.*,com.JdbcConnection.DbConn" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Employee Complete Details</title>
</head>
<style type="text/css">
body {
	
	margin:0px;
	padding:0px;
	font-size:18px;
	line-height:21px;
	color:#ffffff;                                 
	background:url("C:/Intern project/images/blue maroon.jpg");
	font-family:Georgia, "Times New Roman", Times, serif;
}
a{
    
    margin-top:40px;
    margin-left:1175px;
    color:#ffffff;
    font-size:16px;
    

}
.data{
     height:630px;
     margin-top:30px;
	 margin-left:250px;
	 font-size:18px;
	 line-height:21px;
	 color:#f3f3f3; 
	 font-family:Georgia, "Times New Roman", Times, serif;                                	
}
h2{  
     color:#f3f3f3;
     font-size:35px;
     margin-top:50px;
}
 </style>


<body>
<%
Connection con=DbConn.getCon();
int empId = Integer.parseInt(request.getParameter("Employee_id"));
PreparedStatement pst=con.prepareStatement("select * from employee_details where Employee_id=?");
pst.setInt(1,empId);

ResultSet rs=pst.executeQuery();
while(rs.next()){
	%>
	<h2 align="center">EMPLOYEE COMPLETE DETAILS</h2>
   <p><a href="employeeHome.jsp">HOME</a></p>
 
	
<div class="data">
  <table>
	<tr>
	  <td>Id</td><td> : <input type="number" value="<%=rs.getString(1)%>" readonly="true"></td><td><br><br></td>
	</tr>
	<tr> 
	  <td>Name</td><td> : <input type="text" value="<%=rs.getString(2)%>" readonly="true"></td><td><br><br></td>
	</tr>
    <tr> 
	  <td>Role</td><td> : <input type="text" value="<%=rs.getString(3)%>" readonly="true"></td><td><br><br></td>
	</tr>
    <tr> 
	  <td>Department</td><td> : <input type="text" value="<%=rs.getString(4)%>" readonly="true"></td><td><br><br></td>
	</tr>
    <tr> 
	  <td>ReportTo</td><td> : <input type="text" value="<%=rs.getString(5)%>" readonly="true"></td><td><br><br></td>
	</tr>
    <tr> 
	  <td>Email</td><td> : <input type="text" value="<%=rs.getString(6)%>" readonly="true"></td><td><br><br></td>
	</tr>
    <tr> 
	  <td>Mobile Number</td><td> : <input type="number" value="<%=rs.getString(7)%>" readonly="true"></td><td><br><br></td>
	</tr>
    <tr> 
	  <td>Address</td><td> : <input type="text" value="<%=rs.getString(8)%>" readonly="true"></td><td><br><br></td>
	</tr>
    <tr> 
	  <td>gender</td><td> : <input type="text" value="<%=rs.getString(9)%>" readonly="true"></td><td><br><br></td>
	</tr>
    <tr> 
	  <td>status</td><td> : <input type="text" value="<%=rs.getString(10)%>" readonly="true"></td><td><br><br></td>
	</tr>
	<tr> 
	  <td>Username</td><td> : <input type="text" value="<%=rs.getString(11)%>" readonly="true"></td><td><br><br></td>
	</tr>
	<tr> 
	  <td>Password</td><td> : <input type="text" value="<%=rs.getString(12)%>" readonly="true"></td><td><br><br></td>
	</tr>
   </table>
<%} %>
</div>

</body>
</html>