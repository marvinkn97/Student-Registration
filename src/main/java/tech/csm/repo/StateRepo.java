package tech.csm.repo;

import org.springframework.data.jpa.repository.JpaRepository;

import tech.csm.model.State;

public interface StateRepo extends JpaRepository<State, Integer> {
}
