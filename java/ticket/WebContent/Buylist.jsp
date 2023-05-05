<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.List" %>
		<%@ page import="impl.TrainDao" %>
			<%@ page import="entity.Train" %>
				<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
				<html>

				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
					<title>Insert title here</title>
					<style type="text/css">
						h2 {
							font-family: 楷体;
							font-size: 20px
						}

						#a {
							font-family: 楷书;
						}

						#b {
							background-color: #ff9900;
							color: white;
							font-family: 隶书;
							font-size: 25px
						}

						#boder {
							background-color: #2894ff;
							color: white
						}

						#divcss5 {
							border: 1px solid #00F
						}

						body {
							text-align: center
						}
						}
					</style>

					<% TrainDao dao=new TrainDao(); Train train=new Train(); String
						startcity=(String)request.getParameter("Startcity"); String endcity=(String)request.getParameter("Endcity");
						String starttime=(String)request.getParameter("Starttime"); train.setStartcity(startcity);
						train.setEndcity(endcity); train.setStarttime(starttime); List<Object[]> trains = dao.select2(train);
						%>
				</head>

				<body>
					<table border="0" align="center">
						<tr>
							<td><img alt="logo" src="logo.ico" width="50"></td>
							<td>中国铁路客户服务中心-客运中心</td>
						</tr>

					</table>

					<hr style="background-color:#2894ff;height:1px;">
					</hr>
					<form action="Buylist.jsp" method="get">
						车票查询
						<input type="radio" name="radio" class="input" value="1">单程
						<input type="radio" name="radio" class="input" value="2">往返
						出发城市: <input type="text" name="Startcity">
						到达城市: <input type="text" name="Endcity">
						出发日期: <input type="date" name="Starttime">
						<input type="checkbox" name="checkbox">学生票
						<button id="b" type="submit">查询</button>
					</form></br>
					<table border="1" align="center" cellpadding="5px">
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
							<% for(int i=0; i < trains.size(); i++) { String Trainid=null; Object[] train1=trains.get(i);
								out.write("<tr>");
								out.write("<td>"+ train1[0] +"</td>");
								Trainid=train1[0].toString();
								out.write("<td>"+ train1[1] +"</td>");
								out.write("<td>"+ train1[2] +"</td>");
								out.write("<td>"+ train1[3] +"</td>");
								out.write("<td>"+ train1[4] +"</td>");
								out.write("<td>"+ train1[5] +"</td>");
								out.write("<td>"+ train1[6] +"</td>");
								out.write("<td>"+ train1[7] +"</td>");
								out.write("<td>"+ train1[8] +"</td>");
								out.write("<td>"+ train1[9] +"</td>");
								out.write("<td>"+ train1[10] +"</td>
								</form>");
								String url="iorder.jsp?Trainid="+Trainid+"";
								out.write("<td><button onclick=window.location.href='"+url+"'>购票</button></p>");
									out.write("</form>
									</tr>");
									}
									%>
						</tbody>

					</table>

				</body>

				</html>