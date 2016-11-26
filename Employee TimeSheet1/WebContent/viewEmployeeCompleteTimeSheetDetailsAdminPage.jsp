<%@ page language="java" import="java.sql.*,com.JdbcConnection.DbConn" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>view others timeSheet details</title>
</head>

<style type="text/css">
body {
	
	margin:0px;
	padding:0px;
	font-size:18px;
	line-height:21px;
	color:#000000;                                 
	background:url("C:/Intern project/images/clock6.jpg");
	font-family:Georgia, "Times New Roman", Times, serif;
}
a{
    
    margin-top:40px;
    margin-left:1175px;
    color:#f3f3f3;
    font-size:16px;
    

}
.data{
     height:500px;
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
Connection con =DbConn.getCon();
PreparedStatement pst=null;
//String empName=(String)session.getAttribute("empName");
//Integer empId=(Integer)session.getAttribute("empId");	
int t_id = Integer.parseInt(request.getParameter("t_id"));
 pst=con.prepareStatement("select * from timesheet_details where t_id=?");
pst.setInt(1,t_id);
ResultSet rs=null;
rs=pst.executeQuery();
if(rs.next()){
	%>
	<h2 align="center">EMPLOYEE COMPLETE TIMESHEET DETAILS</h2>
   <p><a href="adminHome.jsp">HOME</a></p>
 
	
	
 <div class="data">
  
<table>	

	<tr>
	    <td>TimeSheet ID</td><td> :  <input type="number" value="<%=rs.getString(1)%>" readonly="true"></td><td><br><br></td>
	</tr>
	<tr>
	   <td>Employee ID</td><td>:  <input type="number" value="<%=rs.getString(2)%>" readonly="true"></td><td><br><br></td>
	</tr> 
	<tr>  
       <td>Name</td><td>:  <input type="text" value="<%=rs.getString(3)%>" readonly="true"></td><td><br><br></td>
    </tr>
    <tr> 
       <td>Project</td><td>:  <input type="text" value="<%=rs.getString(4)%>" readonly="true"></td><td><br><br></td> 
    </tr>
    <tr>
       <td>Task</td><td>:  <input type="text" value="<%=rs.getString(5)%>" readonly="true"></td><td><br><br></td>
    </tr>
    <tr> 
       <td>Start Time</td><td>:  <input type="time" value="<%=rs.getString(6)%>" readonly="true"></td><td><br><br></td> 
    </tr>
    <tr>
      <td>End Time</td><td>:  <input type="time" value="<%=rs.getString(7)%>" readonly="true"></td><td><br><br></td>
    </tr>
    <tr>   
      <td>Created Date</td><td>:  <input type="date" value="<%=rs.getString(8)%>" readonly="true"></td><td><br><br><br></td>
    </tr>
    <tr> 
      <td>Additional information</td><td>:  <input type="text"  value="<%=rs.getString(9)%>" readonly="true"></td>
   </tr>
<%} %>
</table>
</div>

</body>
</html>