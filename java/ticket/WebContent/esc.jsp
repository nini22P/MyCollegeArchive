<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <META HTTP-EQUIV='Refresh' CONTENT='1;URL=index.jsp'>
        <title>Insert title here</title>
    </head>

    <body>
        <p>成功</p>
        <% Cookie cookie=new Cookie("id", null); Cookie cookie1=new Cookie("adminid", null); cookie.setMaxAge(0);
            cookie1.setMaxAge(0); response.addCookie(cookie); response.addCookie(cookie1);%>
    </body>

    </html>