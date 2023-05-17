<%@page import="java.time.LocalDate"%>
<%@ include file="../../navbar.jsp" %>
<%@ page import="java.sql.*" %>
<html>
  <body onload="makeActive('datewise')">
  <%
  String eid=request.getParameter("eid");
  LocalDate cdate=LocalDate.now();
  PreparedStatement ps=(PreparedStatement)application.getAttribute("name");
  ps.setString(1,eid);
  ResultSet rst=ps.executeQuery();
  rst.next();
  String name=rst.getString(1);
  %>
  <div class='dvv'>
    <label class='lahu'>View employee wise report</label>
  </div>
   <table class='ta'>
    <tr>
     <td class='pd'>
      <form action='current-date.jsp' method="post">
      <input type="hidden" name="eid" value="<%=eid%>">
      <input type="hidden" name="name" value="<%=name%>">
       <table class='cdta'>
        <tr>
         <td>Current date</td>
         <td align="right"><button class='cdbt'>GO</button></td>
        </tr>
       </table>
      </form>
     </td>
    </tr>
    <tr>
     <td class='pd'>
      <form action='any-date.jsp' method="post">
      <input type="hidden" name="eid" value="<%=eid%>">
      <input type="hidden" name="name" value="<%=name%>">
       <table class='cdta'>
        <tr>
         <td>Any date</td>
         <td><input type='date' class='tb' name='date' max='<%=cdate%>' style='width:15vw' required></td>
         <td align="right"><button class='cdbt'>GO</button></td>
        </tr>
       </table>
      </form>
     </td>
    </tr>
    <tr>
     <td class='pd'>
      <form action="date-between.jsp" method="post">
      <input type="hidden" name="eid" value="<%=eid%>">
      <input type="hidden" name="name" value="<%=name%>">
       <table class='cdta'>
        <tr>
         <td>Date between&nbsp;&nbsp;&nbsp;&nbsp;</td>
         <td><input type='date' class='tb' id='date1' name="date1" style='width:15vw'max='<%=cdate%>' required></td>
         <td><input type='date' class='tb' id='date2' name="date2" style='width:15vw'max='<%=cdate%>' required></td>
         <td align="right"><button class='cdbt' onclick='return compareDate()'>GO</button></td>
        </tr>
       </table>
      </form>
     </td>
    </tr>
   </table>
 </body>
</html>