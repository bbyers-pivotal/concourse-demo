package com.example;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by bbyers on 6/22/16.
 */
@RestController
public class DemoController {

    @RequestMapping("/")
    public void home() {

    }
}
