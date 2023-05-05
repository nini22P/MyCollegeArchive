package io.github.nini22p.dao;

import java.util.List;
import io.github.nini22p.entity.Courses;

public interface ICoursesDao {

    List<Object[]> select();

    int insert(Courses courses);

    int update(Courses courses);

}
