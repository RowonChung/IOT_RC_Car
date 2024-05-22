package com.example.demo.car.controller;


import com.example.demo.car.repository.CarEntity;
import com.example.demo.car.repository.CarRepository;
import com.example.demo.car.repository.dto.FindCar.*;
import com.example.demo.car.service.CarService;
import com.example.demo.car.repository.dto.changeCar.*;
import com.example.demo.car.repository.dto.createCar.*;
import com.example.demo.user.repository.UserEntity;
import com.example.demo.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Optional;


@RestController
@RequiredArgsConstructor
@RequestMapping("/car")
public class CarController {
    private final CarService carService;
    private final CarRepository carRepository;
    private final UserRepository userRepository;

    @PostMapping()
    @ResponseStatus(HttpStatus.CREATED)
    public CreateCarResponse createTemperature(@RequestBody CreateCarRequest createCarRequest){
        CarEntity car  = carService.createCar(createCarRequest);

        CreateCarResponse result = new CreateCarResponse(200, true, "차량이 추가되었습니다.", car.getId());
        return result;
    }

    @GetMapping("/{userId}")
    public FindALlCarResponse findAllByUser(@PathVariable("userId") Long userId){
        Optional<UserEntity> optionalUser = userRepository.findById(userId);
        if (optionalUser.isPresent()) {
            UserEntity userEntity = optionalUser.get();
            List<CarEntity> carList = carRepository.findAllByUser(userEntity);
            FindALlCarResponse result = new FindALlCarResponse(200, true, "조회에 성공하였습니다.", carList);
            return result;
        } else {
            // Handle user not found scenario (e.g., return specific error message)
            return new FindALlCarResponse(404, false, "사용자를 찾을 수 없습니다.", null);
        }
    }

    @GetMapping("/detail/{id}")
    public FindCarResponse findByCar(@PathVariable("id") Long id){
        CarEntity carEntity = carRepository.findById(id).get();

        FindCarResponse result = new FindCarResponse(200, true, "조회에 성공하였습니다.", carEntity);

        return result;
    }

    @PostMapping("/light")
    public FindCarResponse changeLight(@RequestBody ChangeCarLightStateRequest changeCarLightStateRequest){
        CarEntity carEntity = carService.changeLightState(changeCarLightStateRequest);

        FindCarResponse result = new FindCarResponse(200, true, "조회에 성공하였습니다.", carEntity);

        return result;
    }

    @PostMapping("/temperature")
    public FindCarResponse changeTemperature(@RequestBody ChangeCarTemperatureRequest changeCarTemperatureRequest){
        CarEntity carEntity = carService.changeTemperature(changeCarTemperatureRequest);

        FindCarResponse result = new FindCarResponse(200, true, "조회에 성공하였습니다.", carEntity);

        return result;
    }

    @PostMapping("/location")
    public FindCarResponse changeLocation(@RequestBody ChangeCarLocationRequest changeCarLocationRequest){
        CarEntity carEntity = carService.changeLocation(changeCarLocationRequest);

        FindCarResponse result = new FindCarResponse(200, true, "조회에 성공하였습니다.", carEntity);

        return result;
    }

}
