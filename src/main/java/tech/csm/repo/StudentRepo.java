package tech.csm.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import tech.csm.model.Student;

@Repository
public interface StudentRepo extends JpaRepository<Student, Integer> {

}
