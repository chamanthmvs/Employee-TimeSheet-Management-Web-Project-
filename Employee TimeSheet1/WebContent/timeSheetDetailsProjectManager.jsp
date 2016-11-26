<%@ page language="java" import="java.sql.*,java.util.*,java.text.*,com.JdbcConnection.DbConn,java.io.PrintWriter" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="UTF-8">
<title>TimeSheet details</title>
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
    height:300px;
	padding:50px 90px 300px 50px;
	margin-right:180px;
}

</style>

<body>

 <div id="header">

    <div class="top_banner">
      <h1>Add TimeSheet Details</h1>
      <p>add your daily schedule(your timeSheet details)</p>
    </div>

  </div>
  
        <div id="page_content">

    <div class="navigation">
      <ul>
        <li><a href="projectManagerHome.jsp">Home</a></li>
        <li></li>
        <li></li>
        <li></li>
        

      </ul>
    </div>
  </div>
  
        
  <div id="page_content">
  
      <div class="right_section">
      
      <div class="common_content">
            
        <h1 align="center">TIMESHEET DETAILS</h1>
        <hr>
    

<form action="timeSheetDetailsInsert.jsp" method="post">
<%

Connection con=DbConn.getCon();
PreparedStatement pst=null;
pst=con.prepareStatement("select p_name from project_info");
ResultSet rs=pst.executeQuery();

PreparedStatement pst1=con.prepareStatement("select task_name from project_tasks");
ResultSet rs1=pst1.executeQuery();

PreparedStatement pstmt=con.prepareStatement("select role_name from app_roles");
ResultSet rs2=pstmt.executeQuery();

java.util.Date d = new java.util.Date();                       //by default java has given date class we have imported and used the date class here 
 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
 String presentDate =sdf.format(d);
String empName= (String)session.getAttribute("empName");
Integer empId= (Integer)session.getAttribute("empId");
String reportTo =(String)session.getAttribute("reportTo");

%>

<input type="hidden" name="reportTo" value="<%=reportTo%>">
<table align="center">
 <tr>
 	<td>Employee Id</td><td> : <input type="number" name="empId" value="<%=empId %>" readonly="true"></td><td><br><br></td>
 </tr>
 <tr>
   <td>Employee Name</td><td>: <input type="text" name="empName" value="<%=empName%>" readonly="true"></td><td><br><br></td>
 </tr>
 
 <tr>
   <td>Name of the project</td><td>:<select name="p_name" ><%  while(rs.next()){ %><option value="<%= rs.getString(1)%>"><%= rs.getString(1)%></option><% } %></select></td><td><br><br></td>
  </tr>
   <tr>
   <td>Task to be done</td><td> : <select name="task"><% while(rs1.next()){ %><option value="<%=rs1.getString(1) %>"><%=rs1.getString(1)%></option><%}%></select><br><br></td><td><br><br></td>
  </tr>
   <tr> 
    <td>StartTime</td><td>:    <input type="number" name="startHours"  placeholder="Hours:" required="required" >:<input type="number" name="startMinute" placeholder="Minutes:">:<select name="startFormat"><option value="AM">AM</option><option value="PM">PM</option></select></td><td><br><br></td> 
    </tr>
  <tr>
     <td>EndTime</td><td> :    <input type="number" name="endHours" placeholder="Hours:" required="required">:<input type="number" name="endMinute" placeholder="Minutes:" >:<select name="endFormat"><option value="AM">AM</option><option value="PM">PM</option></select></td><td><br><br></td> 
  </tr>
  <tr>
 <td>ProjectCreationDate</td><td>:    <input type="text" name="presentDate" value="<%=presentDate%>" readonly="true"></td><td><br><br></td>
  </tr>
  <tr>
 <td>AdditionalInformation</td><td>:   <textarea rows="5" cols="40" name="addInfo" required="required"></textarea></td><td><br><br></td>
   </tr>
        
</table>

                <br> <center><input type="Submit"value="submit"></center>
                  
  

</form>
</div>
</div>
</div>

</body>
</html>