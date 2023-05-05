<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  <html>

  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户管理</title>
    <style type="text/css">
      #section {
        text-align: center;
      }
    </style>
  </head>

  <body>
    <h2>&nbsp&nbsp用户管理</h2>
    <div id=section>
      <p>请输入要查询用户的信息</p>
      <form id=form action="Useredit.jsp" method="get">
        <select name=seach>
          <option value="id">用户名</option>
          <option value="phone">电话号码</option>
        </select>
        <input type="text" name="s">
        <button type="submit">查询</button>
      </form>
    </div>

  </body>

  </html>