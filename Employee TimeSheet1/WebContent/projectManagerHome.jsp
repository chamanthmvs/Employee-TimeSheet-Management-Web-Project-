<%@ page language="java" import="java.sql.*,com.JdbcConnection.DbConn" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="HomePage.css" rel="stylesheet" type="text/css">

<title>Project Manager Home</title>
</head>
<body>

<div id="wrapper">

  <div id="header">

    <div class="top_banner">
      <h1>Hi Project Manager</h1>
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
        <h1>Employee menu</h1>
        <div class="box">
          <ul>
            <li><a href="displayIndividualEmployeeDataProjectManagerPage.jsp"><b>view My Data</b></a></li>
            <li><a href="employeeDetailsWhoWorkUnderProjectManager.jsp"><b>view Employees Details</b></a></li>
            <li><a href="timeSheetDetailsProjectManager.jsp"><b>add My TimeSheet Details</b></a></li>
            <li><a href="displayIndividualTimeSheetDataProjectManagerPage.jsp"><b>view My TimeSheet Data</b></a></li>
            <li><a href="timeSheetDetailsOfEmployeesWhoWorkUnderProjectManager.jsp"><b>view Employees TimeSheet Details</b></a></li>
             <li><a href="reports.jsp"><b>reports</b></a></li>        
          </ul>
        </div>
      </div>

      <div class="col_1">
        <h1>Note</h1>
        <div class="box">
          <p><marquee>This is for Employees and Project Managers in the company</marquee></p>
          <br>
          <ul>
          <li><p>If you click on Home button you will go to HomePage . if you click on logout then you will be redirected to login page</p></li>
          <li><p>Employees or Project Manager should log-in to view or update their details</p></li>
          <li><p>Project Manager can view details of the employee who work under him</p></li>
          <li><p> Employee can only view his details</p></li>
          </ul>
        </div>
      </div>

    </div>

    <div class="right_section">
      <div class="common_content">
        <h1>ProjectManager Page </h1>
        <hr>
        <h3>This page contains:</h3>
        <hr>
                <p>The first index in the menu indicates that they can view only their details i.e., project manager can view only his details</p><br>
      			<p>The second index in the menu indicates that he can view all the employee details who work under him</p><br>
      			<p>The third index in the menu indicates that he can update his timeSheet data </p><br>
      			<p>The fourth index in the menu indicates that he can view his own timeSheet data</p><br>
      			<p>The fifth index in the menu indicates that he can view the timeSheet details of the employees who work under him</p> 	
      			
        </div>

    </div> 
    <div class="clear"></div>  
</div>
</div>
</body>
</html> 