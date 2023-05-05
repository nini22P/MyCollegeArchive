<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.List" %>
		<%@ page import="impl.TrainDao" %>
			<%@ page import="entity.Train" %>
				<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
				<html>

				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
					<title>车次管理</title>
					<script type="text/javascript">
						function edit(trainid) {
							system.out.print("2333");
						}
					</script>
					<% TrainDao dao=new TrainDao(); List<Object[]> trains = dao.select();
						%>
				</head>

				<body>
					<h2>&nbsp&nbsp车次管理</h2>
					<table border="1" align="center" cellpadding="5px">
						<thead>
							<tr>
								<th><button type="button" onclick="location='AddTrain.jsp'">添加</button></th>
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
							<% for(int i=0; i < trains.size(); i++) { Object[] train=trains.get(i); out.write("<tr>");
								String old=train[0].toString();
								String url="Trainedit.jsp?old="+old+"";
								out.write("<td><button onclick=window.location.href='"+url+"'>修改</button></td>");
								out.write("<td>"+ train[0] +"</td>");
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
								out.write("</tr>");
								}
								%>
						</tbody>

					</table>
				</body>

				</html>