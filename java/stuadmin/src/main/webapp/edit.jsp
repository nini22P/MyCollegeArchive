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
                margin-top: 20px;
            }

            .a1 {
                width: 300px;
            }

            .a3 {
                float: right;
            }
        </style>
        <% String id=(String)request.getParameter("id"); String username=(String)request.getParameter("username");
            String sex=(String)request.getParameter("sex"); String classs=(String)request.getParameter("classs"); String
            professional=(String)request.getParameter("professional"); String
            institute=(String)request.getParameter("institute"); %>
    </head>

    <body>
        <div class=main>
            <form action="" method="get">
                <div class="a1">
                    <label>学号</label><br>
                    <input type="text" name="id" value=<%=id%> class="layui-input"><br>
                    <label>用户名</label><br>
                    <input type="text" name="username" value=<%=username %> class="layui-input"><br>
                    <label>性别</label><br>
                    <select name="sex" class="layui-select">
                        <option class="select1" value="">请选择</option>
                        <option class="select2" value="男">男</option>
                        <option class="select3" value="女">女</option>
                    </select>
                    <br><br>
                    <label>班级</label><br>
                    <input type="text" name="classs" value=<%=classs %> class="layui-input"><br>
                    <label>专业</label><br>
                    <input type="text" name="professional" value=<%=professional %> class="layui-input"><br>
                    <label>学院</label><br>
                    <input type="text" name="institute" value=<%=institute %> class="layui-input"><br>
                </div>
                <div class="a3">
                    <button type="submit" class="layui-btn">确认修改</button>
                </div>
            </form>
        </div>
    </body>

    </html>