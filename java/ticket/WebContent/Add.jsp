<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="impl.TrainDao" %>
        <%@ page import="entity.Train" %>
            <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Insert title here</title>
                <% TrainDao dao=new TrainDao(); Train train=new Train(); String
                    trainid=(String)request.getParameter("Trainid"); String
                    startcity=(String)request.getParameter("Startcity"); String
                    start=(String)request.getParameter("Start"); String endcity=(String)request.getParameter("Endcity");
                    String end=(String)request.getParameter("End"); String
                    starttime=(String)request.getParameter("Starttime"); String
                    endtime=(String)request.getParameter("Endtime"); String
                    seatmode=(String)request.getParameter("Seatmode"); String
                    number=(String)request.getParameter("Number"); String
                    carriage=(String)request.getParameter("Carriage"); String
                    price=(String)request.getParameter("Price"); train.setTrainid(trainid);
                    train.setStartcity(startcity); train.setStart(start); train.setEndcity(endcity); train.setEnd(end);
                    train.setStarttime(starttime); train.setEndtime(endtime); train.setSeatmode(seatmode);
                    train.setNumber(number); train.setCarriage(carriage); train.setPrice(price); dao.insert(train); %>
            </head>

            <body>
                <P>添加成功</P>
            </body>

            </html>