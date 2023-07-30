package com.lsousa.aurum.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.lsousa.aurum.models.AuthorizedUser;

@Repository
public interface AuthUserRepository extends CrudRepository<AuthorizedUser, Long> {
	List<AuthorizedUser> findAll();
}
