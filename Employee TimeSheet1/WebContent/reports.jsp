<%@ page language="java" import="java.sql.*,com.JdbcConnection.DbConn" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reports</title>
</head>

<style type="text/css">
body {
	margin:0px;
	padding:0px;
	font-size:20px;
	line-height:21px;
	color:#ffffff;                                 
	background:url("C:/Intern project/images/texture blue.jpg");
	font-family:Georgia, "Times New Roman", Times, serif;
}

center{
    color :#ffffff;
    position:absolute;
    height: 200px;
    width: 400 px;
    left:35%;
    top:25%;
    margin-top:25px;
    margin-left:30px;
    
}

</style>


<body>

<div class="center">
<center>


<%
Integer empId=(Integer)session.getAttribute("empId");
Connection con =DbConn.getCon();
PreparedStatement pstmt=con.prepareStatement("select created_date from timesheet_details ");
ResultSet rs1=pstmt.executeQuery();

PreparedStatement pst1=con.prepareStatement("select created_date from timesheet_details ");
ResultSet rs2=pst1.executeQuery();


PreparedStatement pst=con.prepareStatement("select employee_name from timesheet_details where reporting_to=?");
pst.setInt(1,empId);
ResultSet rs=pst.executeQuery(); 
%>
<h3 align="center">REPORTS</h3>
<form action="reportsGeneration.jsp">
<table>
  <tr>
 <td>Enter FROM DATE</td><td>:<input type="date" name="fromDate" placeholder="YYYY-MM-DD"></td><td><br><br></td>
 </tr>
 <tr>
 <td>Enter TO DATE</td><td>:<input type="date" name="toDate" placeholder="YYYY-MM-DD"></td><td><br><br></td>
 </tr>     
 <tr>
 <td>Select name</td><td>:  <select name="employee_name"><%  while(rs.next()){ %>
      <option value="<%= rs.getString(1)%>"><%= rs.getString(1)%></option>
  <% } %></select></td><td><br><br></td>
  </tr>
</table>
<br><br>
  <input type="submit" value="Get Reports">
</form>
</center>
</div>
</body>
</html>