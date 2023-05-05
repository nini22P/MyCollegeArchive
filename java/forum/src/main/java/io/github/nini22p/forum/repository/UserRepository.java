package io.github.nini22p.forum.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import io.github.nini22p.forum.entity.User;

public interface UserRepository extends JpaRepository<User, String> {

}
