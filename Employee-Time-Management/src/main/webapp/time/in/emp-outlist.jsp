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
<body onload="makeActive('in')">
  <form action="intime-update.jsp">
    <div class='dv'>
        <label class='hdu'>update Employee in time</label>
    </div>
    <div class='dvv'>
      <select name="eid" id="eid" class="la" onchange="checkEmployee(this)">
         <option value=-1>select Employee</option> 
         <%
           PreparedStatement ps=(PreparedStatement)application.getAttribute("inselect");
           ps.setString(1,"out");
           ResultSet rst=ps.executeQuery();
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