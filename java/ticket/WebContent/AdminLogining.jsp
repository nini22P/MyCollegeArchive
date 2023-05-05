<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="impl.AdminDao" %>
    <%@ page import="entity.Admin" %>
      <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
      <html>

      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <% Object i=null; AdminDao dao=new AdminDao(); Admin admin=new Admin(); String
          id=(String)request.getParameter("Id"); String password=(String)request.getParameter("Password");
          admin.setId(id); admin.setPassword(password); i=dao.select(admin); %>
      </head>

      <body>
        <% if(i !=null) { %>
          <script type="text/javascript">
            document.cookie = "adminid=" +<%=id %>;
            window.location = "Adminmain.jsp";
            alert("登录成功");
          </script>
          <% } else{ %>
            <script type="text/javascript">
              window.location = "AdminLogin.jsp";
              alert("登录失败，检查用户名及密码");
            </script>
            <% } %>

      </body>

      </html>