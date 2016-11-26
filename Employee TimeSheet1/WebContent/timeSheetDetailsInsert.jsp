<%@ page language="java" import="java.sql.*,java.util.*,java.text.*,com.JdbcConnection.DbConn,java.io.PrintWriter" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>retrieve from HTML and store TimeSheet details into database</title>
</head>
<body>

<%
String empId=request.getParameter("empId");
String empName=request.getParameter("empName");
String name=request.getParameter("p_name");
String task=request.getParameter("task");
String startHours=request.getParameter("startHours");
String endHours=request.getParameter("endHours");
String currentDate= request.getParameter("presentDate");
String addInfo=request.getParameter("addInfo");
String startMin =request.getParameter("startMinute");
String endMin=request.getParameter("endMinute");
String startFormat=request.getParameter("startFormat");
String endFormat=request.getParameter("endFormat");

String reportto=request.getParameter("reportTo");
int rto = Integer.parseInt(reportto);

String startTime=startHours+":"+startMin+":"+startFormat;   //this is string concatination concept used here as we know that request.getParameter method is used to retrieve input values so we had retrieved input vaalues for startTime and concatinated them ,the same follows for below also

String endTime=endHours+":"+endMin+":"+endFormat;



PrintWriter pw=response.getWriter();

Connection con =DbConn.getCon();

PreparedStatement pst=con.prepareStatement("insert into timesheet_details(employee_id,employee_name,project,task,start_time,end_time,created_date,add_information,reporting_to) values(?,?,?,?,?,?,?,?,?)");
pst.setString(1,empId);
pst.setString(2,empName);
pst.setString(3,name);
pst.setString(4,task);
pst.setString(5,startTime);
pst.setString(6,endTime);
pst.setString(7,currentDate);
pst.setString(8,addInfo);

pst.setString(9,reportto);
int j=pst.executeUpdate();
if(j>=0){
	System.out.println("your timesheet details have been saved successfully");
	response.sendRedirect("timesheetRegSuccessMsg.html");
}


%>


</body>
</html>