<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="UTF-8" %>
      <%@ page import="io.github.nini22p.entity.Admin" %>
            <%@ page import="io.github.nini22p.impl.AdminDao" %>
                  <% String username=new String(request.getParameter("username")); String password=new
                        String(request.getParameter("password")); Admin admin=new Admin(); admin.setUsername(username);
                        admin.setPassword(password); AdminDao dao=new AdminDao(); Object i=dao.select(admin);
                        out.print(i); %>