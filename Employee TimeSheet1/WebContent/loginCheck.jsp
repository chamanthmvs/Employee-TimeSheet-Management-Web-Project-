<%@ page language="java" import="java.sql.*,com.JdbcConnection.DbConn" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>loginCheck</title>
</head>
<body>
<% 
String uname= request.getParameter("username");
String pwd=request.getParameter("password");
String role=request.getParameter("emp_rolename");

Connection con=DbConn.getCon();

String retriveEmployeeLogins="select employee_id,employee_name,Employee_reportto from employee_details where login_username=? and login_password=? and employee_rolename=?";
String retriveAdminLogins="select * from AdminLoginDetails where username=? and password=?";




PreparedStatement pstmt=null;
ResultSet rs=null;

if(role.equals("Super Admin")){
	
	pstmt=con.prepareStatement(retriveAdminLogins);             //these  prepareStatement,Statement,CallableStatements - these all are interfaces by using this we can communicate with tables in database for inserting data into table and retrieving data from database by 'select' command   ,these can even used for storing data into tables and retrieve data from tables
	pstmt.setString(1, uname);
	pstmt.setString(2, pwd);
	rs=pstmt.executeQuery();                                      // actually this executeUpdate() or executeQuery() is used like "enter"  means it makes automatically to update or does the query execution automatically without again putting any command externally like keeping ';'in mysql or in any other database we use semicoloumn (';') after the select command but in java (like this program) we no need to write that, we just write instructions like  executeUpdate or executeQuery etc................
	if(rs.next()){
		response.sendRedirect("adminHome.jsp");
	}
	else{
		response.sendRedirect("Login.jsp");
	}
	
	
} else if(role.equals("Employee")){
	pstmt=con.prepareStatement(retriveEmployeeLogins);
	pstmt.setString(1, uname);
	pstmt.setString(2, pwd);
	pstmt.setString(3, role);
	rs=pstmt.executeQuery();
	if(rs.next()){
		session.setAttribute("reportTo", rs.getString(3));
		session.setAttribute("empId", rs.getInt(1)); // in select command we have taken employee_id and also employee_name for employee_name we take rs.getString(2)
		session.setAttribute("userName", uname);                             // these sessions are used to available data for other tasks or pages in that session (particular session)  if we use response and request if a request is sent from the client and server recieves the request , if the server sends the response to that request then the data recieved by server(request information data) before sending response to the client will be deleted    simply to say the data will be deleted from server if once the response is given by the server to the request given by client , but if we use session data will not be deleted we can use it in another pages within that project as we are using sessions here
		session.setAttribute("empName", rs.getString(2));
		response.sendRedirect("employeeHome.jsp");
	}
	else{
		response.sendRedirect("Login.jsp");
	}
	
} else if(role.equals("Project Manager")){
	pstmt=con.prepareStatement(retriveEmployeeLogins);	
	pstmt.setString(1, uname);
	pstmt.setString(2, pwd);
	pstmt.setString(3, role);
	rs=pstmt.executeQuery();
	if(rs.next()){
		session.setAttribute("empId", rs.getInt(1));  // getInt is taken because we haven taken employee_id as integer type
		session.setAttribute("userName", uname);		
		session.setAttribute("empName",rs.getString(2));
		response.sendRedirect("projectManagerHome.jsp");
	}
	else{
		response.sendRedirect("Login.jsp");
	}}


%>

</body>
</html>