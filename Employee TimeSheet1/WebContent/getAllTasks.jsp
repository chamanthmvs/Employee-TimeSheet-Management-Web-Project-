
<%@ page language="java" import="java.sql.*,com.JdbcConnection.DbConn" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>getPM</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
 	

 int pid =  Integer.parseInt(  request.getParameter("pid"));
System.out.println("under getTasks"+pid);
    Connection con =DbConn.getCon(); 
PreparedStatement pstmt = con.prepareStatement("select * from project_tasks where project_id=?");
    pstmt.setInt(1,pid);
    ResultSet rs=pstmt.executeQuery();
    out.println("<option>--  select  -- </option>");
    while(rs.next()){ 
	      out.println("<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>");
    }  
	
%>


</body>
</html>