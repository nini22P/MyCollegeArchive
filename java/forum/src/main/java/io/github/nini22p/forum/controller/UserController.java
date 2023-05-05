package io.github.nini22p.forum.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import io.github.nini22p.forum.entity.User;
import io.github.nini22p.forum.repository.UserRepository;

@RestController
public class UserController {

	@Autowired
	UserRepository userRepository;

	@PostMapping("data/adduser")
	public User insertUser(User user) {
		User save = userRepository.save(user);
		return save;
	}

	@PostMapping("data/login")
	public int login(User user) {
		Optional<User> user1 = userRepository.findById(user.getUsername());
		if (user.getUsername().contentEquals(user1.get().getUsername()) == true
				&& user.getPassword().equals(user1.get().getPassword()) == true) {
			System.out.println("登录成功");
			return 1;
		} else {
			System.out.println("登录失败");
			return 0;
		}

	}

}
