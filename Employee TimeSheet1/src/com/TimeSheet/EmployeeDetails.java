package com.TimeSheet;

import java.io.IOException;







import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
//import java.sql.SQLException;
//import java.sql.SQLException;

import com.JdbcConnection.DbConn;

import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;





/**
 * Servlet implementation class EmployeeDetails
 */
@WebServlet("/EmployeeDetails")
public class EmployeeDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmployeeDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
		String name=request.getParameter("emp_name");
		String rolename=request.getParameter("emp_rolename");
		String deptname=request.getParameter("emp_deptname");
		String reportto=request.getParameter("emp_reportto");
		String email=request.getParameter("emp_email");
		String mobileno=request.getParameter("emp_mobilenumber");
		String address=request.getParameter("emp_address");
		String gender=request.getParameter("gender");
		String status=request.getParameter("status");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
	
			
	
		
		PrintWriter pw=response.getWriter();
		
	/*	pw.println("EmployeeName	"+name);
		pw.println("EmployeeRolename	"+rolename);
		pw.println("EmployeeDeptName	"+deptname);
		pw.println("EmployeeReportTo	"+reportto);
		pw.println("EmployeeEmail	"+email);
		pw.println("EmployeeMobileNo	"+mobileno);
		pw.println("EmployeeAddress		"+address);
		pw.println("gender	"+gender);
		pw.println("status	"+status);
		
	*/
		//Connection con=null;
		PreparedStatement pst=null;
		
		try{
			Connection con=DbConn.getCon();
			pst = con.prepareStatement(
					"insert into employee_details(Employee_name,Employee_rolename,Employee_deptname,Employee_reportto,Employee_email,Employee_mobileno,Employee_address,gender,status,login_username,login_password) values(?,?,?,?,?,?,?,?,?,?,?)");
			//  pst.setInt(1,id1);
			  pst.setString(1, name);
			  pst.setString(2,rolename);
			  pst.setString(3,deptname);
			  pst.setString(4,reportto);
			  pst.setString(5,email);
			  pst.setString(6,mobileno);
			  pst.setString(7,address);
			  pst.setString(8, gender);
			  pst.setString(9,status);
			  pst.setString(10,username);
			  pst.setString(11,password);
			  int i=pst.executeUpdate();
			   if(i>=0)
			   {
				   System.out.println("records have been successfuly saved");
				   response.sendRedirect("regSuccessMsg.html");
				   
				 
				   
	        	}
			   pw.close();
				  con.close();
				
          }
		
       catch(Exception e){
    	   e.printStackTrace();
    	   
       }
		 
	

	}
}