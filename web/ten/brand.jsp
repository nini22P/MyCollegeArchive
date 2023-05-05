<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="java.sql.*" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Insert title here</title>
      <style type="text/css">
        .main2 {
          width: 200px;
          height: 200px;
          border: solid 1px;
          float: left;
          margin: 2px;
        }
      </style>
      <% String str="" ; String username="root" ; //数据库账户名 String password="114514" ; //数据库密码 String
        url="jdbc:mysql://localhost:3306/stuadmin?characterEncoding=UTF-8" ; //数据库url Connection
        conn=DriverManager.getConnection(url,username,password); //通过url连接数据库 Statement
        statement=conn.createStatement(); //获取可执行sql语句的对象 String sql="SELECT * FROM students" ; //sql语句，遍历数据表的参数
        ResultSet rs=statement.executeQuery(sql); //执行sql语句并将数据表返回给ResultSet %>
    </head>

    <body>
      <% while (rs.next()){ str=str+"<div class='main2'>"+rs.getString(1)+"</div>";
        }
        out.print(str);
        %>
    </body>

    </html>