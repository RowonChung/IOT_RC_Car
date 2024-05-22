package com.example.demo.user.service;

import com.example.demo.user.jwt.JwtTokenProvider;
import com.example.demo.user.jwt.dto.CreateUser;
import com.example.demo.user.jwt.dto.JwtToken;
import com.example.demo.user.repository.UserEntity;
import com.example.demo.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;


@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService{
    private UserRepository userRepository;
    private AuthenticationManagerBuilder authenticationManagerBuilder;
    private JwtTokenProvider jwtTokenProvider;

    @Autowired
    public UserServiceImpl(UserRepository userRepository, AuthenticationManagerBuilder authenticationManagerBuilder, JwtTokenProvider jwtTokenProvider) {
        this.userRepository = userRepository;
        this.authenticationManagerBuilder = authenticationManagerBuilder;
        this.jwtTokenProvider = jwtTokenProvider;
    }

    @Override
    public UserEntity createUser(CreateUser.CreateUserRequest createUserRequest) {

        if(userRepository.existsByEmail(createUserRequest.getEmail())){
            throw new RuntimeException("이미 가입된 이메일입니다.");
        }

        UserEntity userEntity = UserEntity.builder()
                .email(createUserRequest.getEmail())
                .username(createUserRequest.getUsername())
                .password(createUserRequest.getPassword())
                .build();
        userRepository.save(userEntity);

        return userEntity;
    }

    @Override
    public JwtToken signIn(String username, String password) {
        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(username, password);
        Authentication authentication = authenticationManagerBuilder.getObject().authenticate(authenticationToken);
        System.out.println(authentication);
        JwtToken jwtToken = jwtTokenProvider.generateToken(authentication);
        System.out.println(jwtToken);
        return jwtToken;
    }
}
