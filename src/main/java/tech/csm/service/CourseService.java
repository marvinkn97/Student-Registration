package tech.csm.service;

import java.util.List;

import tech.csm.model.Course;

public interface CourseService {
	List<Course> getAllCourses();
	Course getCourseById(Integer courseId);
}
