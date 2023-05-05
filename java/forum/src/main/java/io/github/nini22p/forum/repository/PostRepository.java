package io.github.nini22p.forum.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import io.github.nini22p.forum.entity.Post;

public interface PostRepository extends JpaRepository<Post, String> {

	@Modifying
	@Query(value = "INSERT INTO post (postpartition,postuser,posttitle,posttext) VALUES (:postpartition,:postuser,:posttitle,:posttext)", nativeQuery = true)
	@Transactional
	int addpost(@Param("postpartition") String postpartition, @Param("postuser") String postuser,
			@Param("posttitle") String posttitle, @Param("posttext") String posttext);

	@Modifying
	@Query(value = "SELECT * FROM `post` WHERE postid = ?1", nativeQuery = true)
	@Transactional
	Iterable<Post> findOne(String id);

	@Modifying
	@Query(value = "SELECT * FROM `post` WHERE postpartition = ?1 ORDER BY lasttime DESC ", nativeQuery = true)
	@Transactional
	Iterable<Post> findSame(String id);

	@Modifying
	@Query(value = "UPDATE post SET postremarks = ?1 WHERE postid = ?2", nativeQuery = true)
	@Transactional
	void addpostremarks(int Postremarks, String Remarkspostid);

}
