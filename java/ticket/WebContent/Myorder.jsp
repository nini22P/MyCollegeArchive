<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.List" %>
		<%@ page import="impl.OrderDao" %>
			<%@ page import="entity.Order" %>
				<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
				<html>

				<head>
					<style type="text/css">
						#a {
							width: 910px;
							margin: 0% auto;
						}

						#wrap {
							width: 960px;
							margin: 0 auto;
							text-align: left;
							background-color: #FFFCEC;
						}

						#head {
							width: 100%;
							overflow: hidden;
							background-color: #2e72bb;
							height: 120px;

						}

						.topnav {
							float: right;
							width: 40%;
							margin-top: 50px;
							font-size: 12px;
						}

						.topnav ul {
							overflow: hidden;
							width: 100%;
						}

						.topnav li {
							float: left;
							color: #4c5a5a;
						}

						.topnav li a {
							color: #2e7ec7;
						}

						.topnav li span {
							margin: 0 8px;
						}

						a:link,
						a:visited {
							text-decoration: none;
							/*超链接无下划线*/
						}

						a:hover {
							text-decoration: underline;
							/*鼠标放上去有下划线*/
						}

						table {
							border-color: #AFEEEE;
						}
					</style>
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
					<title>我的订单</title>
					<% String CookieName="id" ; String Orderid=null; String userid=null; Cookie[] cookies=request.getCookies();
						for(int n=0;n<cookies.length;n++){ Cookie cookie=cookies[n]; if(CookieName.equals(cookie.getName()))
						userid=cookie.getValue(); } OrderDao dao=new OrderDao(); Order order=new Order(); order.setUserid(userid);
						List<Object[]> orders = dao.select2(order);
						%>
				</head>

				<body>




					<div id="wrap">
						<div id="head">
							<div class="topnav">
								<ul>
									<li><a href="#">反馈建议</a><span>|</span></li>
									<li><a href="#">客服中心</a></li>
								</ul>
							</div>
							<div><img src="image/logo.png" width="320" height="100">
								<div style="position:relative;float:right; width:80%;"></div>
							</div>
						</div>

						<div id=a>
							<h4>您现在的位置：<a href="index.jsp">客运首页</a>>用户订单</h4>
							<hr />
							<table border="1" align="center" cellpadding="4px" cellspacing="0">
								<thead>
									<tr>
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
									<% for(int i=0; i < orders.size(); i++) { Object[] order1=orders.get(i); out.write("<tr>");
										out.write("<td>"+ order1[0] +"</td>");
										Orderid=order1[0].toString();
										out.write("<td>"+ order1[1] +"</td>");
										out.write("<td>"+ order1[2] +"</td>");
										out.write("<td>"+ order1[3] +"</td>");
										out.write("<td>"+ order1[4] +"</td>");
										out.write("<td>"+ order1[5] +"</td>");
										out.write("<td>"+ order1[6] +"</td>");
										out.write("<td>"+ order1[7] +"</td>");
										out.write("<td>"+ order1[8] +"</td>");
										out.write("<td>"+ order1[9] +"</td>");
										out.write("<td>"+ order1[10] +"</td>");
										out.write("<td>"+ order1[11] +"</td>");
										out.write("<td>"+ order1[12] +"</td>");
										out.write("<td>"+ order1[13] +"</td>");
										out.write("<td>"+ order1[14] +"</td>");
										String url="Downorder.jsp?Orderid="+Orderid+"";
										out.write("<td><button onclick=window.location.href='"+url+"'>退票</button></td>");
										out.write("</tr>");
										}
										%>
								</tbody>
							</table>
						</div>
					</div>
				</body>

				</html>