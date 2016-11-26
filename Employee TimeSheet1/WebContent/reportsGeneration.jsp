<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.sql.*,com.JdbcConnection.DbConn" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reports generation</title>
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

<table id="employee">
<tr>
  
  
  <th>EmployeeName</th>
  <th>Project</th>
  <th>Task</th>
  <th>Start Time</th>
  <th>End Time</th>
  

<%
 String frmDate=request.getParameter("fromDate");
String datet=request.getParameter("toDate");

 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
 java.util.Date fDate=sdf.parse(frmDate);
 java.util.Date tDate=sdf.parse(datet);
 
String fromDate =  sdf.format(fDate);
String toDate =  sdf.format(tDate);
//java.sql.Date sfDate = new java.sql.Date(fDate.getTime());
 
System.out.println("from date converted.."+fromDate);

String employee_name=request.getParameter("employee_name");
int empId = (Integer)session.getAttribute("empId");


Connection con=DbConn.getCon();
PreparedStatement pst=con.prepareStatement("select * from timesheet_details where reporting_to = ? and created_date between ? and  ?  and employee_name = ?");
pst.setInt(1,empId);
pst.setString(2,fromDate);
pst.setString(3,toDate);
pst.setString(4,employee_name);
ResultSet rs = pst.executeQuery();

while(rs.next()){%>

  <tr> 
       <td><%=rs.getString(3)%></td> 
       <td><%=rs.getString(4)%></td> 
       <td><%=rs.getString(5)%></td> 
       <td><%=rs.getString(6)%></td> 
       <td><%=rs.getString(7)%></td>
  
       	</tr>
  
<%}%>
</table>
</body>
</html>