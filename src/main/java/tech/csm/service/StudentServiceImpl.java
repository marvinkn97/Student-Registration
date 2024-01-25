package tech.csm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tech.csm.model.Student;
import tech.csm.repo.StudentRepo;

@Service
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentRepo studentRepo;

	@Override
	public String registerStudent(Student student) {
		
		student.getAddresses().get(0).setStudent(student);
		
		Student s = studentRepo.save(student);

		return "Student saved successfully with Roll Number " + s.getRollNo();
	}

	@Override
	public List<Student> getAllStudents() {
		return studentRepo.findAll();
	}

}
