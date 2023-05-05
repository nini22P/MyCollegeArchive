<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert title here</title>
        <link rel="stylesheet" href="script/layui/css/layui.css">
        <style type="text/css">
            .main {
                width: 300px;
                margin: auto;
                margin-top: 50px;
            }

            .a1 {
                width: 300px;
                float: left;
            }

            .a2 {
                float: right;
            }
        </style>
        <% String name=(String)request.getParameter("name"); String sex=(String)request.getParameter("sex"); String
            professional=(String)request.getParameter("professional"); String
            institute=(String)request.getParameter("institute"); %>
    </head>

    <body>
        <div class=main>
            <form action="addClass.jsp" method="get">
                <div class="a1">
                    <label>姓名</label><br>
                    <input type="text" name="name" value=<%=name %> class="layui-input"><br>
                    <label>性别</label><br>
                    <input type="text" name="sex" value=<%=sex %> class="layui-input"><br>
                    <label>专业</label><br>
                    <input type="text" name="professional" value=<%=professional %> class="layui-input"><br>
                    <label>学院</label><br>
                    <input type="text" name="institute" value=<%=institute %> class="layui-input"><br>
                    <div class="a2">
                        <button type="submit" class="layui-btn">确认修改</button>
                    </div>
                </div>
        </div>
    </body>

    </html>