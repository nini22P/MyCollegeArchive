package io.github.nini22p.forum.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import io.github.nini22p.forum.entity.Remarks;

public interface RemarksRepository extends JpaRepository<Remarks, String> {

	@Modifying
	@Query(value = "INSERT INTO remarks (remarkspostid,remarksuser,remarkstext) VALUES (?1,?2,?3)", nativeQuery = true)
	@Transactional
	int addremarks(String remarkspostid, String remarksuser, String remarkstext);

	@Modifying
	@Query(value = "SELECT * FROM `remarks` WHERE remarkspostid = ?1", nativeQuery = true)
	@Transactional
	Iterable<Remarks> findOne(String id);

}
