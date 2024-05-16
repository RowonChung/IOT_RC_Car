package com.example.demo.user.jwt.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

public class CreateUser {
    @Data
    public static class CreateUserRequest{
        private  String email;
        private String username;
        private String password;
    }

    @Getter
    @AllArgsConstructor
    public static class CreateUserResponse{
        private int code;
        private Boolean isSuccess;
        private String msg;
    }
}
