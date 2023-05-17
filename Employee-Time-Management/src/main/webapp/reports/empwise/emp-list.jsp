<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="../../navbar.jsp" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>employee in list</title>
</head>
<body onload="makeActive('empwise')">
  <form action="choose-date.jsp">
    <div class='dv'>
        <label class='hdu' style='background-color:orange'>view employee wise reports</label>
    </div>
    <div class='dvv'>
      <select name="eid" id="eid" class="la" onchange="checkEmployee(this)">
         <option value=-1>select Employee</option> 
         <%
           Statement st=(Statement)application.getAttribute("selectall");
           ResultSet rst= st.executeQuery("select eid,name from employeeInfo");
           while(rst.next())
           {
        	   String eid=rst.getString(1);
        	   %>
        	   <option value='<%=eid %>'><%=rst.getString(2)%>(<%=eid %>)</option> 
        	   <% 
           }
         %>
      </select>
    </div>
    <div class='dvv'>
      <button disabled id="bt" class="btn btn-primary">submit</button>
    </div>
    <div class='dvv' id="msg">
      
    </div>
  </form>
</body>
</html>