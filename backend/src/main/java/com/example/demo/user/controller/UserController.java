package com.example.demo.user.controller;

import com.example.demo.user.jwt.dto.CreateUser;
import com.example.demo.user.jwt.dto.JwtToken;
import com.example.demo.user.jwt.dto.SignInDto.SignInRequest;
import com.example.demo.user.jwt.dto.SignInDto.SignInResponse;
import com.example.demo.user.jwt.SecurityUtil;
import com.example.demo.user.repository.UserEntity;
import com.example.demo.user.repository.UserRepository;
import com.example.demo.user.jwt.dto.CreateUser.*;
import com.example.demo.user.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
    private final UserService userService;
    private final UserRepository userRepository;


    @PostMapping()
    @ResponseStatus(HttpStatus.CREATED)
    public CreateUserResponse createUser(@RequestBody CreateUserRequest createUserRequest){
        userService.createUser(createUserRequest);

        CreateUserResponse result = new CreateUserResponse(200, true, "회원가입에 성공하셨습니다.");

        return result;
    }


    @PostMapping("/sign_in")
    public SignInResponse  signIn(@RequestBody SignInRequest signInRequest) {
        String username = signInRequest.getUsername();
        String password = signInRequest.getPassword();
        JwtToken jwtToken = userService.signIn(username, password);

        Optional<UserEntity> user = userRepository.findByEmail(username);

        log.info("request username = {}, password = {}", username, password);
        log.info("jwtToken accessToken = {}, refreshToken = {}", jwtToken.getAccessToken(), jwtToken.getRefreshToken());

        SignInResponse result = new SignInResponse(jwtToken, user.get().getId());

        return result;
    }

    @PostMapping("/test")
    public String test() {
        return SecurityUtil.getNowUserId();
    }

}
