<%@ page language="java" import="java.sql.*,com.JdbcConnection.DbConn" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>working under project manager</title>
</head>

<style type="text/css">
body{
   background:url("C:/Intern project/images/black grey3.jpg");
}
ul{
   color:red;
   margin-left:20px;
}

.navigation{
    margin-top:55px;
    margin-left:1180px;
    color:#ffffff;
    font-size:16px;
   
}
#navigator{
    font-size:20px;
    opacity:0.7;
    color:#000000;
}
h2{
  margin-top:110px;
  font-size:38px;
  opacity:0.7;
  color:#000000;
 

}
p{
  opacity:0.7;
   color:red;
   margin-top:5px;
   margin-left:10px;
   font-size:24px;
   
}
#employee 
{
   /* background:url("C:/Intern project/images/white.jpg"); */
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

#employee td, #employee th {
    border: 1px solid #ddd;
    text-align: left;
    padding: 8px;
}

#employee tr:nth-child(even){background-color: #f2f2f2}

#employee tr:hover {background-color: #ddd;}

#employee th {
    padding-top: 12px;
    padding-bottom: 12px;
    /*background-color: #4CAF50;*/
    opacity:0.8;
    background:url("C:/Intern project/images/royal blue.jpg");
    color: white;
    
}

</style>



<body>
 <h2 align="center">EMPLOYEE DETAILS</h2>
   <div class="navigation"> <a id="navigator" href="projectManagerHome.jsp">HOME</a> </div>                                                                   
 <ul style="list-style-type:square"><li><p>The below table describes you brief DETAILS OF THE EMPLOYEE WHO WORK UNDER PROJECT MANAGER in the company</p></li></ul>
<table id="employee">
 

<tr>
	
	<th>Name</th>
	<th>Role</th>
	<th>Department</th>
	<th>Actions</th>
</tr>	
<%
Connection con=DbConn.getCon();
PreparedStatement pst=null;
ResultSet rs=null;
String empName=(String)session.getAttribute("empName");
Integer empId=(Integer)session.getAttribute("empId");
	
 pst=con.prepareStatement("select * from employee_details where Employee_reportto=?");
pst.setInt(1,empId);
 rs=pst.executeQuery();
while(rs.next()){
	%>
	<tr>
          <td><%=rs.getString(2)%></td> 
          <td><%=rs.getString(3)%></td> 
          <td><%=rs.getString(4)%></td> 
    <td><a href="viewEmployeeCompleteDetails.jsp?Employee_id=<%=rs.getInt(1)%>">View</a></td>
	</tr>

<%}
%>

</table>


</body>
</html>