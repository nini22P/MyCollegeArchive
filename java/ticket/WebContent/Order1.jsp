<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.List" %>
		<%@ page import="impl.OrderDao" %>
			<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
			<html>

			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
				<title>订单管理</title>
				<% OrderDao dao=new OrderDao(); List<Object[]> orders = dao.select1();
					%>
			</head>

			<body>
				<table border="1" align="center" cellpadding="5px">
					<thead>
						<tr>
							<th>&nbsp</th>
							<th>订单号</th>
							<th>用户姓名</th>
							<th>联系号码</th>
							<th>列车号</th>
							<th>车厢</th>
							<th>座号</th>
							<th>座位</th>
							<th>价格</th>
							<th>订单日期</th>
							<th>出发城市</th>
							<th>起始站</th>
							<th>终点城市</th>
							<th>终点站</th>
							<th>发车时间</th>
							<th>到达时间</th>
						</tr>
					</thead>
					<tbody>
						<% for(int i=0; i < orders.size(); i++) { Object[] order=orders.get(i); out.write("<tr>");
							String Orderid=null;
							Orderid=order[0].toString();
							String url="aorder.jsp?Orderid="+Orderid+"";
							out.write("<td><button onclick=window.location.href='"+url+"'>退票</button></td>");
							out.write("<td>"+ order[0] +"</td>");
							out.write("<td>"+ order[1] +"</td>");
							out.write("<td>"+ order[2] +"</td>");
							out.write("<td>"+ order[3] +"</td>");
							out.write("<td>"+ order[4] +"</td>");
							out.write("<td>"+ order[5] +"</td>");
							out.write("<td>"+ order[6] +"</td>");
							out.write("<td>"+ order[7] +"</td>");
							out.write("<td>"+ order[8] +"</td>");
							out.write("<td>"+ order[9] +"</td>");
							out.write("<td>"+ order[10] +"</td>");
							out.write("<td>"+ order[11] +"</td>");
							out.write("<td>"+ order[12] +"</td>");
							out.write("<td>"+ order[13] +"</td>");
							out.write("<td>"+ order[14] +"</td>");
							out.write("</tr>");
							}
							%>
					</tbody>
				</table>

			</body>

			</html>