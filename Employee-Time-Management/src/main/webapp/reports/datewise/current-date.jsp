<%@ include file="../../navbar.jsp" %>
<%@ page import="java.sql.*" %>
<%@page import="java.time.LocalDate"%>
<%@ page import="com.time.utility.TimeUtility" %>

<html>
<head>

</head>
 <body onload="makeActive('datewise')">
 <%
     
     PreparedStatement ps=(PreparedStatement)application.getAttribute("curdate");
      ps.setObject(1,LocalDate.now());
      ResultSet rst=ps.executeQuery();
     
 %>
 <div class='dvv'>
     <label class='hdu'>Report of current date</label>
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
  <div class='dv'>
   <label class='lah' style='color:green'>Welcome to the employee out and in management</label>
  </div>
 </body>
</html>