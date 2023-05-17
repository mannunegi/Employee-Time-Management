package com.time.management;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


@WebListener
public class ConnectionListener implements ServletContextListener {

    public void contextInitialized(ServletContextEvent sce)  { 
         System.out.println("hello");
    	try {
    		ServletContext context = sce.getServletContext();
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		Connection cndb=DriverManager.getConnection("jdbc:mysql://localhost/","root","12345");
    		createDatabase(cndb);
    		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost/time_management","root","12345");
    		createTable(cn);
    		//for inserting employee info in the employeeInfo table
    		PreparedStatement psinsert = cn.prepareStatement("insert into employeeInfo values(?,?,?,?)");
    		context.setAttribute("insert", psinsert);
    		
    		//for in time
    		PreparedStatement psinselect=cn.prepareStatement("select eid,name from employeeInfo where status=?");
			context.setAttribute("inselect", psinselect);
			PreparedStatement psouttime=cn.prepareStatement("insert into timeInfo(eid,outtime,intime,totaltime,date) values(?,?,?,?,?)");
			context.setAttribute("outtime", psouttime);
			PreparedStatement psstatus=cn.prepareStatement("update employeeInfo set status=? where eid=?");
			context.setAttribute("status", psstatus);
			//this is of time in and out
			PreparedStatement psinupdate=cn.prepareStatement("update timeInfo set intime=?,totaltime=? where eid=?");
			context.setAttribute("inupdate", psinupdate);
			PreparedStatement psselectout=cn.prepareStatement("select outtime from timeInfo where eid=?");
			context.setAttribute("outselect", psselectout);
			//reports for date wise--------------------------------------------
			PreparedStatement pscurdate=cn.prepareStatement("select * from timeInfo where date=?");
			context.setAttribute("curdate", pscurdate);
			
			//employee details-----------------------------------------------
			PreparedStatement psdetails=cn.prepareStatement("select * from employeeInfo where eid=?");
			context.setAttribute("empDetails", psdetails);
		    
			//date between------------------------------------------
			PreparedStatement psdatebetween=cn.prepareStatement("select * from timeInfo where date between ? and ?");
			context.setAttribute("datebetween", psdatebetween);
			
			//employee list------------------------------------------
			 context.setAttribute("selectall", cn.createStatement());
			 
			 //employee name------------------------------
			 PreparedStatement psname=cn.prepareStatement("select name from employeeInfo where eid=?");
			 context.setAttribute("name",psname);
			 
    		//empwise current time-----------------------------------------
			 
			 PreparedStatement pscurdate1=cn.prepareStatement("select * from timeInfo where date=? and eid=?");
			  context.setAttribute("curdate1", pscurdate1);
			 
			  //empwise date between-------------------------------------------------------------------------
			  PreparedStatement psdatebetween1=cn.prepareStatement("select * from timeInfo where eid=? and date between ? and ?");
				context.setAttribute("datebetween1", psdatebetween1);
			 
    	}
    	catch(Exception e)
    	{
    		e.printStackTrace();
    	}
    }
    public void createDatabase(Connection cn)
    {
    	try {
			Statement st = cn.createStatement();
			st.execute("create database if not exists time_management");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    public void createTable(Connection cn) throws SQLException
    {
    	
    	Statement st = cn.createStatement();
    	st.execute("create table if not exists employeeInfo(eid int primary key,name varchar(50),department varchar(50),status varchar(50))");
    	st.execute("create table if not exists timeInfo(id int primary key auto_increment,eid int,outtime varchar(25),intime varchar(25),totaltime varchar(25),date date,foreign key(eid) references employeeinfo(eid))");
    	
    }
}
