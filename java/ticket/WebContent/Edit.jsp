<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="impl.UsereditDao" %>
    <%@ page import="entity.Useredit" %>
      <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
      <html>

      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <% UsereditDao dao=new UsereditDao(); Useredit useredit=new Useredit(); String
          old=(String)request.getParameter("Old"); String phone=(String)request.getParameter("Phone"); String
          name=(String)request.getParameter("Name"); String password=(String)request.getParameter("Password");
          useredit.setOld(old); useredit.setPhone(phone); useredit.setName(name); useredit.setPassword(password); int
          a=dao.update(useredit); %>
      </head>

      <body>
        <% if(a>=0) out.write("<p>修改成功</p>");
          %>

      </body>

      </html>