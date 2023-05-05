<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.List" %>
		<%@ page import="impl.TrainDao" %>
			<%@ page import="entity.Train" %>
				<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
				<html>

				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
					<title>列车时刻表</title>
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

						<p class="p"><img alt="logo" src="image/logo.ico" width="50" align="absbottom">列车时刻表查询</p>

						<hr />
						<h4>您现在的位置：<a href="index.jsp">客运首页</a>>列车时刻表</h4>
						<div id=a>
							<table border="1" align="center" cellpadding="5px" cellspacing="0">
								<thead>
									<tr>
										<th>车次号</th>
										<th>起点城市</th>
										<th>起点站</th>
										<th>终点城市</th>
										<th>终点站</th>
										<th>出发时间</th>
										<th>到达时间</th>
										<th>座位类型</th>
										<th>票数量</th>
										<th>车厢号</th>
										<th>价格</th>
									</tr>
								</thead>
								<tbody>
									<% for(int i=0; i < trains.size(); i++) { Object[] train=trains.get(i); String Trainid=null;
										out.write("<tr>");
										out.write("<td>"+ train[0] +"</td>");
										Trainid=train[0].toString();
										out.write("<td>"+ train[1] +"</td>");
										out.write("<td>"+ train[2] +"</td>");
										out.write("<td>"+ train[3] +"</td>");
										out.write("<td>"+ train[4] +"</td>");
										out.write("<td>"+ train[5] +"</td>");
										out.write("<td>"+ train[6] +"</td>");
										out.write("<td>"+ train[7] +"</td>");
										out.write("<td>"+ train[8] +"</td>");
										out.write("<td>"+ train[9] +"</td>");
										out.write("<td>"+ train[10] +"</td>
										</form>");
										String url="iorder.jsp?Trainid="+Trainid+"";
										out.write("<td><button onclick=window.location.href='"+url+"'>购票</button></p>");
											out.write("</tr>");
											}
											%>
								</tbody>

							</table>
						</div>
					</div>
				</body>

				</html>