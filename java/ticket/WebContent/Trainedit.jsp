<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="entity.Train" %>
        <%@ page import="impl.TrainDao" %>
            <%@ page import="java.util.List" %>
                <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
                <html>

                <head>
                    <style type="text/css">
                        #section {
                            width: 400px;
                            margin: 0% auto;
                        }
                    </style>
                    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                    <title>Insert title here</title>
                    <% String Trainid=null; String Startcity=null; String Start=null; String Endcity=null; String
                        End=null; String Starttime=null; String Endtime=null; String Seatmode=null; String Number=null;
                        String Carriage=null; String Price=null; TrainDao dao=new TrainDao(); Train train=new Train();
                        String old=(String)request.getParameter("old"); train.setOld(old); List<Object[]> trains =
                        dao.select1(train);
                        for(int i = 0; i < trains.size(); i++) { Object[] train1=trains.get(i);
                            Trainid=train1[0].toString(); Startcity=train1[1].toString(); Start=train1[2].toString();
                            Endcity=train1[3].toString(); End=train1[4].toString(); Starttime=train1[5].toString();
                            Endtime=train1[6].toString(); Seatmode=train1[7].toString(); Number=train1[8].toString();
                            Carriage=train1[9].toString(); Price=train1[10].toString(); } %>
                </head>

                <body>
                    <h2>&nbsp&nbsp修改车次</h2>
                    <div id=section>

                        <form action="Editer.jsp" method="get">
                            <input type="hidden" name="Old" value="<%=old%>">
                            从&nbsp<input type="text" name="Startcity" value="<%=Startcity%>">
                            <input type="text" name="Start" value="<%=Start%>"></br></br>
                            到&nbsp<input type="text" name="Endcity" value="<%=Endcity%>">
                            <input type="text" name="End" value="<%=End%>"></br></br>
                            起始时间:<input type="date" name="Starttime" value="<%=Starttime%>">→
                            <input type="date" name="Endtime" value="<%=Endtime%>"></br></br>
                            座位类型:&nbsp<select name="Seatmode">
                                <option value="无座">无座</option>
                                <option value="硬座">硬座</option>
                                <option value="软卧">软卧</option>
                            </select></br></br>
                            票数量：<input type="text" name="Number" value="<%=Number%>"></br></br>
                            车厢号：<input type="text" name="Carriage" value="<%=Carriage%>"></br></br>
                            价&nbsp&nbsp&nbsp格：<input type="text" name="Price" value="<%=Price%>"></br></br>
                            &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<button
                                type="submit">确定修改</button>
                        </form>
                    </div>

                </body>

                </html>