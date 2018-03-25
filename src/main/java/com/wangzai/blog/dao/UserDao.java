package com.wangzai.blog.dao;

import com.wangzai.blog.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao extends JpaRepository<User, Integer>{

    User findUserByUsernameAndPassword(String username, String passowrd);

    User findByUsername(String username);

}
