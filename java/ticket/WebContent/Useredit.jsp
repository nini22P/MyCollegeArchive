<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="impl.UsereditDao" %>
        <%@ page import="entity.Useredit" %>
            <%@ page import="java.util.List" %>
                <%@ page import="java.util.ArrayList" %>
                    <!DOCTYPE html
                        PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
                        <% String Phone=null; String Id=null; String Name=null; String Password=null; String
                            seach=(String)request.getParameter("seach"); String s=(String)request.getParameter("s");
                            UsereditDao dao=new UsereditDao(); List<Object[]> users = new ArrayList<Object[]>();
                                if(seach=="phone") users = dao.selectbyphone(s);
                                else users = dao.selectbyid(s);
                                for(int i = 0; i < users.size(); i++) { Object[] user=users.get(i); Id=(String)user[0];
                                    Password=(String)user[1]; Name=(String)user[2]; Phone=(String)user[3]; } %>
                                    <style type="text/css">
                                        #section {
                                            align: center;
                                        }
                                    </style>

                    </head>

                    <body>
                        <h2>&nbsp&nbsp修改信息</h2>
                        <div id=section>
                            <form action="Edit.jsp" method="get">
                                <input type="hidden" name=Old value="<%=Id%>">
                                登录密码：<input type="Password" name=Password value="<%=Password%>"></br></br>
                                姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名：<input type="text" name="Name"
                                    value="<%=Name%>"></br></br>
                                联系电话：<input type="text" name="Phone" value="<%=Phone%>"></br></br>
                                <button Type="submit">修改</button>
                            </form>
                        </div>

                    </body>

                    </html>