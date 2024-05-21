package com.example.demo.user.service;

import com.example.demo.user.jwt.dto.CreateUser;
import com.example.demo.user.jwt.dto.JwtToken;
import com.example.demo.user.repository.UserEntity;

public interface UserService {
    UserEntity createUser(CreateUser.CreateUserRequest createUserRequest);
    JwtToken signIn(String email, String password);
}
