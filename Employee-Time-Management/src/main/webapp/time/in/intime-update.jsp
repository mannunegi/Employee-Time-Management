<%@ include file="../../navbar.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.time.utility.TimeUtility" %>
<%@ page import="java.time.LocalDate" %>
<html>
 <body onload="makeActive('in')">
 <%
 String eid=request.getParameter("eid");
 PreparedStatement ps1=(PreparedStatement)application.getAttribute("outselect");
 ps1.setString(1, eid);
 ResultSet rst=ps1.executeQuery();
 rst.next();
 String outtime=rst.getString(1);
 
  PreparedStatement ps=(PreparedStatement)application.getAttribute("inupdate");
  String intime=TimeUtility.getCurrentTime();
  ps.setString(1, intime);
  ps.setString(2,TimeUtility.getTotalTime(intime,outtime));
  ps.setString(3, eid);
  ps.executeUpdate();
  
  PreparedStatement ps2=(PreparedStatement)application.getAttribute("status");
  ps2.setString(1,"in");
  ps2.setString(2, request.getParameter("eid"));
  ps2.executeUpdate();
  %>
  <div class='dv'>
   <label class='lah' style='color:green'>Employee in time has been updated successfully </label>
  </div>
 </body>
</html>