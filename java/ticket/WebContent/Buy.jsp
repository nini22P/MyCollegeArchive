<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.List" %>
		<%@ page import="impl.TrainDao" %>
			<%@ page import="entity.Train" %>
				<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
				<html lang="en">

				<head>
					<meta charset="utf-8">
					<meta name="viewport" content="width=device-width, initial-scale=1">
					<title>火车票</title>
					<style type="text/css">
						#wrap {
							width: 1050px;
							height: 500px;
							margin: 0 auto;
							text-align: left;
							background-color: #FFFCEC;
						}

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
					</style>
					<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css 

">
					<link rel="stylesheet" href="/resources/demos/style.css">
					<script src="https://code.jquery.com/jquery-1.12.4.js 

"></script>
					<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js 

"></script>
					<style type="text/css">
						#a {
							width: 900px;
							margin: 0% auto;
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

					<script type="text/javascript">
						function Responsive($a) {
							if ($a == true) $("#Device").css("opacity", "100");
							if ($a == false) $("#Device").css("opacity", "0");
							$('#iframe-wrap').removeClass().addClass('full-width');
							$('.icon-tablet,.icon-mobile-1,.icon-monitor,.icon-mobile-2,.icon-mobile-3').removeClass('active');
							$(this).addClass('active');
							return false;
						};
					</script>
					<% TrainDao dao=new TrainDao(); List<Object[]> trains = dao.select();
						%>
				</head>

				<body>

					<div id="wrap">

						<table border="0" align="center">
							<tr>
								<td><img alt="logo" src="image/logo.ico" width="50"></td>
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
						</form>
						<div id="y">
							<div id="wrap">

								<hr />

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
						</div>

					</div>

				</body>

				</html>