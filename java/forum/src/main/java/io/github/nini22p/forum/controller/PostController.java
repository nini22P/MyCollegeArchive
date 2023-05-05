package io.github.nini22p.forum.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import io.github.nini22p.forum.entity.Post;
import io.github.nini22p.forum.repository.PostRepository;

@RestController
public class PostController {

	@Autowired
	PostRepository postRepository;

	@GetMapping("/data/lastpost")
	public HashMap<String, Object> lastPost() {
		Sort sort = new Sort(Direction.DESC, "lasttime");
		Iterable<Post> post = postRepository.findAll(sort);
		HashMap<String, Object> map = new HashMap<>(16);
		map.put("data", post);
		return map;
	}

	@PostMapping("/data/addpost")
	public int addpost(Post post) {
		try {
			postRepository.addpost(post.getPostpartition(), post.getPostuser(), post.getPosttitle(), post.getPosttext());
			System.out.println("发布成功");
			return 1;
		} catch (Exception e) {
			System.out.println("发布失败");
			return 0;
		}

	}

	@GetMapping("/data/post/{id}")
	public HashMap<String, Object> post(@PathVariable("id") String id) {
		Iterable<Post> post = postRepository.findOne(id);
		HashMap<String, Object> map = new HashMap<>(16);
		map.put("data", post);
		return map;
	}

	@GetMapping("/data/allpost/{id}")
	public HashMap<String, Object> allpost(@PathVariable("id") String id) {
		Iterable<Post> post = postRepository.findSame(id);
		HashMap<String, Object> map = new HashMap<>(16);
		map.put("data", post);
		return map;
	}
}
