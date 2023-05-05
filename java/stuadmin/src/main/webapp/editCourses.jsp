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
            }

            .a1 {
                width: 300px;
                float: left;
            }

            .a2 {
                float: right;
            }
        </style>
        <% String courseid=(String)request.getParameter("courseid"); String
            course=(String)request.getParameter("course"); String teacher=(String)request.getParameter("teacher");
            String classroom=(String)request.getParameter("classroom"); String
            professional=(String)request.getParameter("professional"); String
            institute=(String)request.getParameter("institute"); %>
    </head>

    <body>
        <div class=main>
            <form action="" method="get">
                <div class="a1">
                    <label>课程id</label><br>
                    <input type="text" name="courseid" value=<%=courseid %> class="layui-input"><br>
                    <label>课程</label><br>
                    <input type="text" name="course" value=<%=course %> class="layui-input"><br>
                    <label>教师</label><br>
                    <input type="text" name="teacher" value=<%=teacher %> class="layui-input"><br>
                    <label>教室</label><br>
                    <input type="text" name="classroom" value=<%=classroom %> class="layui-input"><br>
                    <label>专业</label><br>
                    <input type="text" name="professional" value=<%=professional %> class="layui-input"><br>
                    <label>学院</label><br>
                    <input type="text" name="institute" value=<%=institute %> class="layui-input"><br>
                    <div class="a2">
                        <button type="submit" class="layui-btn">确认添加</button>
                    </div>
                </div>
        </div>
    </body>

    </html>