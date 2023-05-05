<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>管理员主页</title>
        <script type="text/javascript">
            var adminid = document.cookie.split(";")[0].split("=")[1];
        </script>
        <style type="text/css">
            #header {
                background-color: #e4007f;
                color: #ffffff;
                padding: 15px;
            }

            #nav {
                background-color: #FFFFFF;
                width: 15%;
                height: 500px;
                float: left;
                text-align: center;
                border: solid;
                border-color: #eeeeee;
            }

            a:link,
            a:visited {
                display: block;
                color: #000000;
                text-decoration: none;
                padding: 5px;
                background-color: #FFFFFF;
                font-size: 20px;
            }

            a:hover,
            a:active {
                background-color: orange;
            }

            #section {
                width: 82%;
                heigth: 500px;
                float: left;
            }

            #frame {
                width: 100%;
                height: 600px;
            }
        </style>
    </head>

    <body>
        <div id=header>
            <h1>&nbsp&nbsp&nbsp&nbsp网上铁路购票系统</h1>

        </div>

        <div id=nav>
            <p>功能导航</p>
            <hr>
            <a href="Train.jsp" target="view_frame">车次管理</a>
            <a href="User.jsp" target="view_frame">用户管理</a>
            <a href="Order.jsp" target="view_frame">订单管理</a>
            <hr>
            <a href='esc.jsp'>退出</a>

        </div>

        <div id=section>
            <iframe id=frame src="Train.jsp" name="view_frame" frameborder=0></iframe>
        </div>
    </body>

    </html>