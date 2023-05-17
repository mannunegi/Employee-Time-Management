<%@ include file="../../navbar.jsp" %>
<%@ page import="java.sql.*" %>
<%@page import="java.time.LocalDate"%>
<%@ page import="com.time.utility.TimeUtility" %>
<html>
<head>
</head>
 <body onload="makeActive('datewise')">
 <%
      String d1=request.getParameter("date1");
      String d2=request.getParameter("date2");
      LocalDate ldate1=LocalDate.parse(d1);
      LocalDate ldate2=LocalDate.parse(d2);
 
     PreparedStatement ps=(PreparedStatement)application.getAttribute("datebetween1");
      ps.setString(1, request.getParameter("eid"));
      ps.setObject(2, ldate1);
      ps.setObject(3, ldate2);
     ResultSet rst=ps.executeQuery();
 %>
 <div class='dvv'>
     <label class='hdu'>Report of <%=request.getParameter("name") %> date between <%=TimeUtility.getDateFormater(d1) %> and <%=TimeUtility.getDateFormater(d2)%></label>
  </div>
     <div class="container">
        <div class="card mx-auto">
         <div class="card-body">
           <%
           if(!rst.next())
           {
        	   %>
        	   <div class="dv">
        	     <label class="lah" style='color: red'>No employee out on this date</label>
        	   </div>
        	   <%
        	   return ;
           }
           %>
            <div class="table scrollit">
              <table class="table table-hover">
                 <thead>
                   <tr>
                    <th>S.No</th><th>Emp Id</th><th>Out Time</th><th>In Time</th><th>Total Time</th><th>Date</th>
                   </tr> 
                 </thead>
                 <tbody>
                 <%
                 int sn=0;
                 do
                 {
                	 String eid=rst.getString("eid");
                	 String intime=rst.getString("intime");
                	 String totaltime=rst.getString("totaltime");
                	 String date=TimeUtility.getDateFormater(rst.getString("date"));
                	 %>
                	 <tr>
                	 <td><%=++sn %></td>
                	 <td><a href='/Employee-Time-Management/employee/emp-details.jsp?eid=<%=eid%>'><%=eid %></a></td>
                	 <td><%=rst.getString("outtime") %></td>
                	 <td style='color:<%=intime.equals("not in yet")?"red":"green" %>'><%=intime %></td>
                	 <td style='color:<%=totaltime.equals("not applicable")?"red":"green"%>'><%=totaltime %></td>
                	 <td><%=date %></td>
                	 </tr>
                	 <% 	 
                 }while(rst.next());
                 %>
                 </tbody>
              </table>
            </div>
         </div>        
        </div>
     </div>
 </body>
</html>