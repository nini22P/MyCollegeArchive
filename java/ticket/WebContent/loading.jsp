<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="impl.UserDao" %>
    <%@ page import="entity.User" %>
      <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
      <html>

      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <% UserDao dao=new UserDao(); User user=new User(); Object i=null; String id=(String)request.getParameter("Id");
          String password=(String)request.getParameter("Password"); user.setId(id); user.setPassword(password);
          i=dao.login(user); %>

      </head>

      <body>
        <% if(i !=null) { %>
          <script type="text/javascript">
            document.cookie = "id=" +<%=id %>;
            window.location = "index.jsp";
          </script>
          <% } else{ %>
            <script type="text/javascript">
              window.location = "Login.jsp";
              alert("登录失败，检查用户名及密码");
            </script>
            <% } %>

      </body>

      </html>