package io.github.nini22p.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import io.github.nini22p.entity.Classs;
import io.github.nini22p.entity.Students;
import io.github.nini22p.impl.ClasssDao;
import io.github.nini22p.impl.CoursesDao;
import io.github.nini22p.impl.StudentsDao;
import io.github.nini22p.impl.TeacherDao;

@Controller
public class stuController {

	@RequestMapping("/student")
	public @ResponseBody StringBuilder hiThere() {
		StudentsDao dao = new StudentsDao();
		List<Object[]> students = dao.select();
		StringBuilder str = new StringBuilder("");
		int j = students.size();
		str.append("{");
		str.append("\"code\":0,");
		str.append("\"msg\":\"\"");
		str.append(",\"count\":" + j);
		str.append(",\"data\":[");
		for (int i = 0; i < students.size(); i++) {
			Object[] student = students.get(i);
			str.append("{");
			str.append("\"id\":\"" + student[0]);
			str.append("\",\"username\":\"" + student[1]);
			str.append("\",\"sex\":\"" + student[2]);
			str.append("\",\"classs\":\"" + student[3]);
			str.append("\",\"professional\":\"" + student[4]);
			str.append("\",\"institute\":\"" + student[5]);
			str.append("\"}");
			if (i < (students.size() - 1))
				str.append(",");
		}
		str.append("]}");
		return str;
	}

	@RequestMapping(value = "student/delete/{teamname}", method = RequestMethod.GET)
	@ResponseBody
	public String studel(@PathVariable String teamname, HttpServletRequest request) {
		String id = request.getParameter("id");
		StudentsDao dao = new StudentsDao();
		Students students = new Students();
		students.setId(id);
		dao.delete(students);
		System.out.println("删除了" + id);
		return id;
	}

	@RequestMapping("/classs")
	public @ResponseBody StringBuilder classs() {
		ClasssDao dao = new ClasssDao();
		List<Object[]> classs = dao.select();
		StringBuilder str = new StringBuilder("");
		int j = classs.size();
		str.append("{");
		str.append("\"code\":0,");
		str.append("\"msg\":\"\"");
		str.append(",\"count\":" + j);
		str.append(",\"data\":[");
		for (int i = 0; i < classs.size(); i++) {
			Object[] classss = classs.get(i);
			str.append("{");
			str.append("\"name\":\"" + classss[0]);
			str.append("\",\"years\":\"" + classss[1]);
			str.append("\",\"teacher\":\"" + classss[2]);
			str.append("\",\"classroom\":\"" + classss[3]);
			str.append("\",\"professional\":\"" + classss[4]);
			str.append("\",\"institute\":\"" + classss[5]);
			str.append("\"}");
			if (i < (classs.size() - 1))
				str.append(",");
		}
		str.append("]}");
		return str;
	}

	@RequestMapping(value = "classs/delete/{teamname}", method = RequestMethod.GET)
	@ResponseBody
	public String classsdel(@PathVariable String teamname, HttpServletRequest request) {
		String name = request.getParameter("name");
		ClasssDao dao = new ClasssDao();
		Classs classs = new Classs();
		classs.setName(name);
		dao.delete(classs);
		System.out.println("删除了" + name);
		return name;
	}

	@RequestMapping("/courses")
	public @ResponseBody StringBuilder courses() {
		CoursesDao dao = new CoursesDao();
		List<Object[]> classs = dao.select();
		StringBuilder str = new StringBuilder("");
		int j = classs.size();
		str.append("{");
		str.append("\"code\":0,");
		str.append("\"msg\":\"\"");
		str.append(",\"count\":" + j);
		str.append(",\"data\":[");
		for (int i = 0; i < classs.size(); i++) {
			Object[] classss = classs.get(i);
			str.append("{");
			str.append("\"courseid\":\"" + classss[0]);
			str.append("\",\"course\":\"" + classss[1]);
			str.append("\",\"teacher\":\"" + classss[2]);
			str.append("\",\"classroom\":\"" + classss[3]);
			str.append("\",\"professional\":\"" + classss[4]);
			str.append("\",\"institute\":\"" + classss[5]);
			str.append("\"}");
			if (i < (classs.size() - 1))
				str.append(",");
		}
		str.append("]}");
		return str;
	}

	@RequestMapping("/teacher")
	public @ResponseBody StringBuilder teacher() {
		TeacherDao dao = new TeacherDao();
		List<Object[]> teacher = dao.select();
		StringBuilder str = new StringBuilder("");
		int j = teacher.size();
		str.append("{");
		str.append("\"code\":0,");
		str.append("\"msg\":\"\"");
		str.append(",\"count\":" + j);
		str.append(",\"data\":[");
		for (int i = 0; i < teacher.size(); i++) {
			Object[] teachers = teacher.get(i);
			str.append("{");
			str.append("\"name\":\"" + teachers[0]);
			str.append("\",\"sex\":\"" + teachers[1]);
			str.append("\",\"professional\":\"" + teachers[2]);
			str.append("\",\"institute\":\"" + teachers[3]);
			str.append("\"}");
			if (i < (teacher.size() - 1))
				str.append(",");
		}
		str.append("]}");
		return str;
	}
}