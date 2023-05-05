<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.List" %>
		<%@ page import="impl.TrainDao" %>
			<%@ page import="entity.Train" %>
				<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
				<html>

				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
					<title>余票</title>
					<style type="text/css">
						#a {
							width: 900px;
							margin: 0% auto;
						}

						#wrap {
							width: 960px;
							margin: 0 auto;
							text-align: left;
							background-color: #FFFCEC;
						}

						.p {
							font-size: 30px;
							font-family: 楷体;
							color: blue;
						}

						table {
							border-color: #AFEEEE;
						}
					</style>
					<% TrainDao dao=new TrainDao(); List<Object[]> trains = dao.select();
						%>
				</head>

				<body>
					<div id="wrap">
						<p class="p"><img alt="logo" src="image/logo.ico" width="50" align="absbottom">余票查询</p>
						<hr />
						<h4>您现在的位置：<a href="index.jsp">客运首页</a>>余票查询</h4>
						<div id=a>
							<table border="1" align="center" cellpadding="5px" cellspacing="0">
								<thead>
									<tr>
										<th>起点城市</th>
										<th>终点城市</th>
										<th>票数量</th>
									</tr>
								</thead>
								<tbody>
									<% for(int i=0; i < trains.size(); i++) { Object[] train=trains.get(i); String Trainid=null;
										out.write("<tr>");
										out.write("<td>"+ train[1] +"</td>");
										out.write("<td>"+ train[3] +"</td>");
										out.write("<td>"+ train[8] +"</td>");
										out.write("</tr>");
										}
										%>
								</tbody>
							</table>
						</div>
					</div>
				</body>

				</html>