<%@ page language="java" import="java.sql.*,com.JdbcConnection.DbConn" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Home Page</title>
<meta name="description" content="to update daily schedule done at the end of the day in the company">
<meta name="keywords" content="Employee Details, TimeSheet Details, Company Details">
<link href="HomePage.css" rel="stylesheet" type="text/css">
</head>
<body>

<div id="wrapper">

  <div id="header">

    <div class="top_banner">
      <h1>Hi Employee!</h1>
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
            <li><a href="displayIndividualEmployeeDataEmployeePage.jsp"><b>View My Data</b></a></li>
            <li><a href="timeSheetDetailsEmployee.jsp"><b>Add My TimeSheet Details</b></a></li>
            <li><a href="displayIndividualTimeSheetDataEmployeePage.jsp"><b>View My TimeSheet Data</b></a></li>
            
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
        <h1>Employee Page </h1>
        <hr>
        <h3>This page contains:</h3>
        <hr>
      					<p>If you want to add your daily schedule then you can just add your TimeSheet data just by selecting "add my timeshet details"</p><br>
      			<p>The remaining select boxes are for viewing your personal data as well as timeSheet data</p><br>
      			<p>If you select "View My Data" then you can just view your own data i.e., personal information</p><br>
      			<p>If you select "View My TimeSheet Data" then you can just view your timeSheet details</p><br> 	



        </div>

    </div> 
    <div class="clear"></div>  
</div>
</div>

</body>
</html>