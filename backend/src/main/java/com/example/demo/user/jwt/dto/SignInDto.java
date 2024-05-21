package com.example.demo.user.jwt.dto;

import lombok.*;


public class SignInDto {
    @Getter
    @Setter
    @ToString
    @NoArgsConstructor
    public static class SignInRequest{
        private String username;
        private String password;
    }

    @Getter
    @AllArgsConstructor
    public static class SignInResponse {
        private JwtToken jwtToken;
        private Long userId;
    }

}
