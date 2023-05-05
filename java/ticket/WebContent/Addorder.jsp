<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="entity.Order" %>
    <%@ page import="impl.OrderDao" %>
      <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
      <html>

      <head>
        <style type="text/css">
          #a {
            width: 720px;
            margin: 0% auto;
            align=center;
          }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <% OrderDao dao=new OrderDao(); Order order=new Order(); String userid=(String)request.getParameter("Userid");
          String trainid=(String)request.getParameter("Trainid"); String date=(String)request.getParameter("date");
          String id=(String)request.getParameter("Id"); String name=(String)request.getParameter("Name"); String
          number=(String)request.getParameter("Number"); order.setUserid(userid); order.setTrainid(trainid);
          order.setDate(date); order.setId(id); order.setName(name); order.setNumber(number); order.setState("1"); int
          n=dao.insert(order); %>
      </head>

      <body>
        <% if(n>=0){

          out.write("<div id=a>
            <p>
            <h2>提交订单成功</h2>");
            out.write("您的车票订单已提交，请等待出票</br></br>");
            out.write("<button onclick=location='Myorder.jsp'>我的订单</button>");
            out.write("<button onclick=location='index.jsp'>首页</button></p>
          </div>");
          }
          %>

      </body>

      </html>