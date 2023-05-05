<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.List" %>
		<%@ page import="entity.Train" %>
			<%@ page import="impl.TrainDao" %>
				<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
				<html>

				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
					<title>确认订单</title>
					<style type="text/css">
						#a {
							width: 720px;
							margin: 0% auto;
						}

						#b {
							width: 400px;
							height: 700px;
							margin: 0% auto;

						}
					</style>
					<script type="text/javascript">
						var id = document.cookie.split(";")[0].split("=")[1];
						if (id == null) {
							setInterval("redirect();", 1000);
							function redirect() {
								window.location.href = "Login.jsp";
								alert("请登录");
							}

						}
					</script>
					<% TrainDao dao=new TrainDao(); Train train=new Train(); String old=(String)request.getParameter("Trainid");
						String Trainid=null; String Number=null; train.setOld(old); List<Object[]> trains = dao.select1(train);
						%>
				</head>

				<body>
					<div id=a>
						<h2>提交订单</h2>
						<div id=b>
							<script type="text/javascript">
								var id = document.cookie.split(";")[0].split("=")[1];
								form1.id.value = id;
							</script>
							<% String CookieName="id" ; String id=null; Cookie[] cookies=request.getCookies(); for(int
								n=0;n<cookies.length;n++){ Cookie cookie=cookies[n]; if(CookieName.equals(cookie.getName()))
								id=cookie.getValue(); } for(int i=0; i < trains.size(); i++) { Object[] train1=trains.get(i);
								out.write("<p>"+"车次号："+ train1[0] +"</p>");
								Trainid=(String)train1[0];
								out.write("<p>"+ train1[1] +"→"+train1[3] +"</p>");
								out.write("<p>"+ train1[2] +"→" +train1[4] +"</p>");
								out.write("<p>"+ train1[5] +"→"+train1[6] +"</p>");
								out.write("<p>"+ train1[7] +"</p>");
								Number=train1[8].toString();
								out.write("<p>"+"票价："+ train1[10] +"</p>");
								}
								%>
								<form action="Addorder.jsp" method="get">
									<input type="hidden" name=Userid value="<%=id%>">
									<input type="hidden" name=Trainid value="<%=Trainid%>">
									<input type="hidden" name=Number value="<%=Number%>">
									<input type="text" name="date" id="date" value="" style=" display:none">
									<script type="text/javascript">
										window.onload = function () {
											var nowDate = new Date();
											var str = nowDate.getFullYear() + "-" + (nowDate.getMonth() + 1) + "-" + nowDate.getDate();
											document.getElementById("date").value = str;
										}  
									</script>
									乘客姓名：<input type="text" name=Name></br></br>
									身份证：<input type="text" name=Id></br></br>
									<button type="submit">提交订单</button>
								</form>
						</div>
					</div>

				</body>

				</html>