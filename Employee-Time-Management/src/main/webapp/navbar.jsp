<html>
 <head>
  <%
  String path=application.getContextPath();
  %>
  <script src='<%=path%>/JS/script.js'></script>
  <link href='<%=path%>/CSS/style.css' rel='stylesheet'>
  <link href='<%=path%>/CSS/bootstrap.min.css' rel='stylesheet'>
 </head>
 <body bgcolor='cyan'>
   <hr style='border:2px solid green'>
    <nav class='navbar navbar-expand navbar-light bg-light'>
     <ul class='nav nav-pills mx-auto'>
      <li><a id="home" class='nav-link lau' href='/Employee-Time-Management'>Home</a>
      <li><a id='add' class='nav-link lau' href='/Employee-Time-Management/employee/add_emp.jsp'>Add employee</a>
      <li><a id='out' class='nav-link lau' href='/Employee-Time-Management/time/out/emp-inlist.jsp'>Time Out</a>
      <li><a id='in' class='nav-link lau' href='/Employee-Time-Management/time/in/emp-outlist.jsp'>Time In</a>
      <li><a id='datewise' class='nav-link lau' href='/Employee-Time-Management/reports/datewise/choose-date.jsp'>Date wise report</a>
      <li><a id='empwise' class='nav-link lau' href='/Employee-Time-Management/reports/empwise/emp-list.jsp'>Employee wise report</a>
     </ul>
    </nav>
   <hr style='border:2px solid green'>
 </body>
</html>