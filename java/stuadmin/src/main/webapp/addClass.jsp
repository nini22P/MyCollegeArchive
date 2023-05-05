<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="io.github.nini22p.impl.ClasssDao" %>
        <%@ page import="io.github.nini22p.entity.Classs" %>
            <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <title>Insert title here</title>
                <link rel="stylesheet" href="script/layui/css/layui.css">
                <style type="text/css">
                    .abc {
                        width: 300px;
                        height: 200px;
                        margin: auto;
                        margin-top: 200px;
                    }
                </style>
                <% String name=(String)request.getParameter("name"); String years=(String)request.getParameter("years");
                    String teacher=(String)request.getParameter("teacher"); String
                    classroom=(String)request.getParameter("classroom"); String
                    professional=(String)request.getParameter("professional"); String
                    institute=(String)request.getParameter("institute"); ClasssDao dao=new ClasssDao(); Classs
                    classs=new Classs(); classs.setName(name); classs.setYears(years); classs.setTeacher(teacher);
                    classs.setClassroom(classroom); classs.setProfessional(professional);
                    classs.setInstitute(institute); dao.insert(classs); %>
            </head>

            <body>
                <div class="abc">
                    <button type="button" class="layui-btn" onclick="location.href='ClassList.html'">返回</button>
                    <button type="button" class="layui-btn" onclick="location.href='addClass.html'">继续添加</button>
                </div>
            </body>

            </html>