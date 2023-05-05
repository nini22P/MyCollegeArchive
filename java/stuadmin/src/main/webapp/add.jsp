<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ page import="io.github.nini22p.impl.StudentsDao" %>
    <%@ page import="io.github.nini22p.entity.Students" %>
      <% String id=new String(request.getParameter("id")); String username=new String(request.getParameter("username"));
        String sex=new String(request.getParameter("sex")); String classs=new String(request.getParameter("classs"));
        String professional=new String(request.getParameter("professional")); String institute=new
        String(request.getParameter("institute")); StudentsDao dao=new StudentsDao(); Students students=new Students();
        students.setId(id); students.setUsername(username); students.setSex(sex); students.setClasss(classs);
        students.setProfessional(professional); students.setInstitute(institute); Object i=dao.insert(students);
        out.print(i); %>