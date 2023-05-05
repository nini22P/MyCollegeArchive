<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="impl.UserDao" %>
    <%@ page import="entity.User" %>
      <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
      <html>

      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <% UserDao dao=new UserDao(); User user=new User(); String id=(String)request.getParameter("Id"); String
          password=(String)request.getParameter("Password"); String name=(String)request.getParameter("Name"); String
          id1=(String)request.getParameter("Id1"); String phone=(String)request.getParameter("Phone"); user.setId(id);
          user.setPassword(password); user.setName(name); user.setId1(id1); user.setPhone(phone); dao.insert(user); %>
      </head>

      <body>
        <% %>
          <script type="text/javascript">
            window.location = "index.jsp";
            alert("注册成功");
          </script>
          <% %>

      </body>

      </html>