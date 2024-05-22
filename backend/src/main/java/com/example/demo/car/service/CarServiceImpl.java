package com.example.demo.car.service;

import com.example.demo.car.repository.CarEntity;
import com.example.demo.car.repository.CarRepository;
import com.example.demo.car.repository.dto.changeCar;
import com.example.demo.car.repository.dto.createCar.*;
import com.example.demo.user.repository.UserEntity;
import com.example.demo.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.demo.car.repository.dto.changeCar.*;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CarServiceImpl implements  CarService{
    private UserRepository userRepository;
    private CarRepository carRepository;

    @Autowired
    public CarServiceImpl(UserRepository userRepository, CarRepository carRepository) {
        this.userRepository = userRepository;
        this.carRepository = carRepository;
    }

    @Override
    public CarEntity createCar(CreateCarRequest createCarRequest) {
        UserEntity user = userRepository.findById(createCarRequest.getUserId()).get();


        CarEntity carEntity = CarEntity.builder()
                .lightState(createCarRequest.getLightState())
                .longitude(createCarRequest.getLongitude())
                .latitude(createCarRequest.getLatitude())
                .temperature( createCarRequest.getTemperature())
                .ipAddress(createCarRequest.getIpAddress())
                .direction(createCarRequest.getDirection())
                .user(userRepository.findById(createCarRequest.getUserId()).get())
                .build();
        carRepository.save(carEntity);

        return carEntity;
    }

    @Override
    public CarEntity changeLightState(ChangeCarLightStateRequest changeCarLightStateRequest) {
        if(!carRepository.existsById(changeCarLightStateRequest.getCarId())){
            throw new RuntimeException("존재 하지 않는 차 입니다.");
        }

        CarEntity carEntity = carRepository.findById(changeCarLightStateRequest.getCarId()).get();

        carEntity.setLightState(carEntity.getLightState()*(-1));
        carRepository.save(carEntity);

        return carEntity;
    }

    @Override
    public CarEntity changeLocation(ChangeCarLocationRequest changeCarLocationRequest) {
        if(!carRepository.existsById(changeCarLocationRequest.getCarId())){
            throw new RuntimeException("존재 하지 않는 차 입니다.");
        }

        CarEntity carEntity = carRepository.findById(changeCarLocationRequest.getCarId()).get();

        carEntity.setLatitude(changeCarLocationRequest.getLatitude());
        carEntity.setLongitude(changeCarLocationRequest.getLongitude());
        carEntity.setDirection(changeCarLocationRequest.getDirection());
        carRepository.save(carEntity);

        return carEntity;
    }

    @Override
    public CarEntity changeTemperature(ChangeCarTemperatureRequest changeCarTemperatureRequest) {
        if(!carRepository.existsById(changeCarTemperatureRequest.getCarId())){
            throw new RuntimeException("존재 하지 않는 차 입니다.");
        }
        CarEntity carEntity = carRepository.findById(changeCarTemperatureRequest.getCarId()).get();

        carEntity.setTemperature(changeCarTemperatureRequest.getTemperature());
        carRepository.save(carEntity);

        return carEntity;
    }
}
