<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="java.util.List" %>
    <%@ page import="impl.AdminDao" %>
      <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
      <html>

      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>管理员登录</title>
        <style type="text/css">
          #a {
            margin: 5% auto;
            width: 320px;
            height: 300px;
          }
        </style>

      </head>

      <body>
        <div id="a">
          <h1>管理员登录</h1>
          <form action="AdminLogining.jsp" method="get">
            账号：<input type="text" name="Id"></br></br>
            密码：<input type="password" name="Password"></br></br>
            &nbsp<input type="reset" value="重置">
            <button type="submit"">登录</button>
</form>
</div>

</body>
</html>