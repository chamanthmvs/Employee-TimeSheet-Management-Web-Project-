<%@ page language="java" import="java.sql.*,com.JdbcConnection.DbConn" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="HomePage.css" rel="stylesheet" type="text/css">

<title>Admin Home Page</title>
</head>
<body>

<div id="wrapper">

  <div id="header">

    <div class="top_banner">
      <h1>Hi Admin</h1>
      <p>welcome to your page</p>
    </div>

  </div>
    <div id="page_content">

    <div class="navigation">
      <ul>
        <li><a href="HomePage.html"><b>Home</b></a></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li><a href="Login.jsp"><b>Logout</b></a>
      </ul>
    </div>
    
    <div class="left_side_bar">

      <div class="col_1">
        <h1>Admin menu</h1>
        <div class="box">
          <ul>
            <li><a href="displayAllEmployeeData.jsp"><b>View Employees Details</b></a></li>
            <li><a href="employeeDetails.jsp"><b>Add Employee Details</b></a></li>
            <li><a href="displayAllEmployeeTimeSheetData.jsp"><b>view Employees TimeSheet details</b></a></li>
            <li><a href="displayProjectManagersDetails.jsp"><b>view Project Managers Details</b></a>
           <li><a href="displayProjectManagersTimeSheetDetails.jsp"><b>view ProjectManager TimeSheet Details</b></a></li>         
          </ul>
        </div>
      </div>

      <div class="col_1">
        <h1>Note</h1>
        <div class="box">
          
          
          <ul>
          <li><p>If you click on Home button you will go to HomePage . if you click on logout then you will be redirected to login page</p></li>
          <li><p>This is Admin page where he have an access of adding or deleting an employee from a company</p></li>
          </ul>
        </div>
      </div>

    </div>

    <div class="right_section">
      <div class="common_content">
        <h1>SuperAdmin Page</h1>
        <hr>
        <h3>This page contains:</h3>
        <hr>
                <p>The first index in the menu indicates that he can view all the employee details in the company he can even view project manager details</p><br>
      			<p>The second index in the menu indicates that he can add employee details if any employee joins the company</p><br>
      			<p>The third index in the menu indicates that he can view TimeSheet data of the all the employees in the company including project manager</p><br>
      			
        </div>

    </div> 
    <div class="clear"></div>  
</div>
</div>
</body>
</html> 
