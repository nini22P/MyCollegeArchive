<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
   <%@ page import="impl.OrderDao" %>
      <%@ page import="entity.Order" %>
         <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
         <html>

         <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>取消订单</title>
            <style type="text/css">
               #a {
                  width: 720px;
                  margin: 0% auto;
                  align=center;
               }
            </style>
         </head>
         <% OrderDao dao=new OrderDao(); Order order=new Order(); String state="0" ; String
            orderid=(String)request.getParameter("Orderid"); order.setOrderid(orderid); order.setState(state); int
            n=dao.update(order); %>

            <body>

               <% if(n>=0){

                  out.write("<div id=a>
                     <p>
                     <h2>退票成功</h2></br>");
                     out.write("<button onclick=location='Myorder.jsp'>我的订单</button>&nbsp&nbsp&nbsp");
                     out.write("<button onclick=location='index.jsp'>首页</button></p>
                  </div>");
                  }
                  %>


            </body>

         </html>