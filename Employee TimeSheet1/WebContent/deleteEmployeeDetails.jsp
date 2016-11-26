<%@ page language="java" import="java.sql.*,com.JdbcConnection.DbConn" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Connection con =DbConn.getCon();
PreparedStatement pst=null;
int empId = Integer.parseInt(request.getParameter("Employee_id"));

 pst=con.prepareStatement("delete  from employee_details where Employee_id=?");
pst.setInt(1,empId);
int n=pst.executeUpdate();
if(n>=0){
	System.out.println("deleted successfully");
	response.sendRedirect("displayAllEmployeeData.jsp");
}






%>

</body>
</html>