package io.github.nini22p.forum.controller;

import java.util.HashMap;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import io.github.nini22p.forum.entity.Post;
import io.github.nini22p.forum.entity.Remarks;
import io.github.nini22p.forum.repository.PostRepository;
import io.github.nini22p.forum.repository.RemarksRepository;

@RestController
public class RemarksController {

	@Autowired
	RemarksRepository remarksRepository;

	@Autowired
	PostRepository postRepository;

	@GetMapping("/data/remarks/{id}")
	public HashMap<String, Object> post(@PathVariable("id") String id) {
		Iterable<Remarks> remarks = remarksRepository.findOne(id);
		HashMap<String, Object> map = new HashMap<>(16);
		map.put("data", remarks);
		return map;
	}

	@PostMapping("/data/addremarks")
	public int addpost(Remarks remarks) {
		System.out.println(remarks.getRemarkspostid() + remarks.getRemarksuser() + remarks.getRemarkstext());
		try {
			remarksRepository.addremarks(remarks.getRemarkspostid(), remarks.getRemarksuser(), remarks.getRemarkstext());
			Optional<Post> postremark = postRepository.findById(remarks.getRemarkspostid());
			postRepository.addpostremarks(Integer.parseInt(postremark.get().getPostremarks()) + 1,
					remarks.getRemarkspostid());
			System.out.println("回复成功");
			return 1;
		} catch (Exception e) {
			System.out.println("回复失败");
			return 0;
		}

	}

}
