package tech.csm.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import tech.csm.model.City;

public interface CityRepo extends JpaRepository<City, Integer> {
	
	@Query("SELECT c FROM City c WHERE c.state.stateId = :sId")
	List<City> findCitiesByStateId(@Param("sId") Integer stateId);

}
