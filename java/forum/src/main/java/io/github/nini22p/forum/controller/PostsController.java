package io.github.nini22p.forum.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PostsController {
    @RequestMapping("/post/{id}")
    public String hello() {
        return "posts";
    }

}