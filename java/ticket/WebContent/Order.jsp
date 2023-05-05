<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <style type="text/css">
            #nav {
                width: 10%;
                height: 40px;
                float: left;

            }

            a:link,
            a:visited {
                display: block;
                color: #000000;
                text-decoration: none;
                padding: 5px;
                background-color: #FFFFFF;
                font-size: 15px;
            }

            a:hover,
            a:active {
                background-color: orange;
            }

            #section {
                width: 80%;
                float: left;
            }

            #frame {
                width: 100%;
                height: 500px;
            }
        </style>
    </head>

    <body>
        <h2>&nbsp&nbsp订单管理</h2>

        <div id=nav>
            <a href="Order1.jsp" target="view_frame_1">订单</a>
            <a href="Order0.jsp" target="view_frame_1">已取消</a>
            <a href="Orderall.jsp" target="view_frame_1">全部</a>
        </div>

        <div id=section>
            <iframe id=frame src="Order1.jsp" name="view_frame_1" frameborder=0></iframe>
        </div>
    </body>

    </html>