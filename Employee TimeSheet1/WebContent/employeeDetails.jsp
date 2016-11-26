<%@ page language="java" import="java.sql.*,com.JdbcConnection.DbConn" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<title>Add New Employee Details</title>

</head>
<style type="text/css">

h1, h2, h3, h4, h5, h6 {
	font-weight:normal;
}

h1 {
	font-size:33px;
	margin-bottom:10px;
}
/*----start header----*/
#header {
	padding:5px  203px 20px 180px;
}

#header .top_banner{
	background:url("C:/Intern project/images/header.jpg");        
	height:150px;
	padding:60px 90px 0px 280px;
	border:#496066 solid 1px;
}

#header h1{
	
	font-size:32px;
	color:#000000;
	margin:0px;
	font-family:Georgia, "Times New Roman", Times, serif;
	font-weight:bold;
	padding:0px 0px 10px;
	
}

#header h1 a {
	color:#000000;
	text-decoration: none;
}

#header h1 a:hover {
	text-decoration: none;
}

#header p{
	
	font-size:16px;
	margin-left:1px;
	color:#00000;
	font-family:Georgia, "Times New Roman", Times, serif;
}

body {
	margin:0px;
	padding:0px;
	font-size:16px;
	line-height:21px;
	color:#113e5d;
	background:url("C:/Intern project/images/shaded black.jpg");
	background-color:#9ba0a3;
	font-family:Georgia, "Times New Roman", Times, serif;
}


.navigation{
height:20px;
width:880px;
margin:-20px 200px 0px 10px;
	
	
	padding:10px 0px 30px 30px;
	background:url("C:/Intern project/images/menu-bg.jpg");
}

.navigation ul{
	margin:0px;
	padding:0px;
}

.navigation ul li{
	margin:0px;
	padding:0px 32px;
	display:inline;
	font-size:15px;
	list-style-type:none;
	border-right:#868B8F dotted 2px;
}

.navigation ul li a{
	color:#ffffff;
	text-decoration:none;
}

.navigation ul li a:hover{
	text-decoration:underline;
}

.navigation ul li:last-child {
	border-right:none;
}

#page_content{
	
	padding:0px 15px 0px 200px;
}
#page_content .right_section{
	width:1150px;
	float:right;
}
.common_content{
color:#000000;
    background:url("C:/Intern project/images/light blue yellow.png");
    height:400px;
	padding:50px 90px 300px 50px;
	margin-right:180px;
}

</style>
<body>


  <div id="header">

    <div class="top_banner">
      <h1>Add Employee Details</h1>
      <p>add the details of the new employee</p>
    </div>

  </div>
  
        <div id="page_content">

    <div class="navigation">
      <ul>
        <li><a href="adminHome.jsp">Home</a></li>
        <li></li>
        <li></li>
        <li></li>
        

      </ul>
    </div>
  </div>
  
        
  <div id="page_content">
  
      <div class="right_section">
      
      <div class="common_content">
            
        <h1 align="center">EMPLOYEE DETAILS</h1>
        <hr>
    
<form action="EmployeeDetails" method="post">
<script>
function reportTo() {
    var x = document.getElementById("role").value;
	if(x=="Project Manager"){
    document.getElementById("demo").innerHTML = '<option value="-1">-- Select -- </option><option value="Super Admin">Super Admin</option>';
	} else if(x=="Super Admin"){
	  alert("U should not give admin role to  employees");
	} else if(x=="Employee"){
	     var xhttp = new XMLHttpRequest();                            //everything written in the script tag is -it is a java code which can be used to select only specific roles not by displaying all at a time
         xhttp.onreadystatechange = function() {                                                            
         if (xhttp.readyState == 4 && xhttp.status == 200) {
            document.getElementById("demo").innerHTML = xhttp.responseText;
         }
         };
		 xhttp.open("GET", "getPM.jsp", true);
		 
		 xhttp.send();
	}
		
}
</script>
  
 
<%
Connection con =DbConn.getCon();
PreparedStatement pst=con.prepareStatement("select role_name from app_roles");   //in my sql "<>" ,"!=" -this both indicates not equal to  ,so used it here
ResultSet rs =null;
 rs=pst.executeQuery();
 
 PreparedStatement pstmt=con.prepareStatement("select dept_name from department");
 ResultSet rs1=pstmt.executeQuery();
%>



<table>

          <tr>
    <td><b>EmployeeName</b></td><td>    : <input type="text" name="emp_name" required="required"></td><td><br><br></td>
         </tr>        
         <tr> 
    <td><b>EmployeeRole</b></td><td>    : <select id="role" name="emp_rolename" onchange="reportTo()"> <option value="-1">-- select --</option><%  while(rs.next()){ %>
      <option value="<%= rs.getString(1)%>"><%= rs.getString(1)%></option>
  <% } %></select></td><td><br><br></td>
       </tr>
       <tr>  
 <td><b>EmployeeDeptName</b></td><td>   : <select name="emp_deptname"><% while(rs1.next()){ %><option value="<%= rs1.getString(1)%>"><%= rs1.getString(1) %></option><%} %></select><td><br><br></td>
       </tr>
  <tr>
 <td><b>EmployeeReportTo</b></td><td>   : <select id="demo" name="emp_reportto">
	 </select></td><td><br><br></td>
       </tr>
       <tr>  
<td><b>EmployeeEmail</b></td><td>       : <input type="email" name="emp_email" required="required"></td><td><br><br></td>
       </tr>
       <tr> 
<td><b>EmployeeMobileNo</b></td><td>    : <input type="text" name="emp_mobilenumber" required="required"></td><td><br><br></td>
       </tr>
 
       <tr>  
    <td><b>EmployeeAddress</b></td><td>: <input type="text" name="emp_address" required="required"></td><td><br><br></td>
       </tr> 
       <tr>
    <td><b>Gender</b></td><td>         : Male<input type="radio" name="gender" value="Male"> Female<input type="radio"name="gender"value="Female"></td><td><br><br></td> 
      </tr>


     <tr><td><b>Username</b></td><td>  : <input type="text" name="username"></td><td><br><br></td></tr>
      <tr><td><b>password</b></td><td> : <input type="password" name="password"></td><td><br></br></td></tr>
     <tr><td><b> Status</b></td><td>   : Active <input type="radio" name="status" value="active"> Inactive<input type="radio" name="status" value="inactive"></td><td><br><br></td></tr>
     </table>
                       
            <br><center><button type="Submit"value="submit">Submit</button></center>

</form>
</div>
</div>
</div>
</body>
</html>