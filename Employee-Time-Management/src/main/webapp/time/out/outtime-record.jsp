<%@ include file="../../navbar.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.time.utility.TimeUtility" %>
<%@ page import="java.time.LocalDate" %>
<html>
 <body onload="makeActive('out')">
 <%
  PreparedStatement ps=(PreparedStatement)application.getAttribute("outtime");
  ps.setString(1, request.getParameter("eid"));
  ps.setString(2, TimeUtility.getCurrentTime());
  ps.setString(3, "not in yet");
  ps.setString(4, "not applicable");
  ps.setObject(5, LocalDate.now());
  ps.executeUpdate();
  
  PreparedStatement ps1=(PreparedStatement)application.getAttribute("status");
  ps1.setString(1, "out");
  ps1.setString(2, request.getParameter("eid"));
  ps1.executeUpdate();
  %>
  <div class='dv'>
   <label class='lah' style='color:green'>Employee out time has been recorded successfully </label>
  </div>
 </body>
</html>