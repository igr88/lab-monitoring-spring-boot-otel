package me.dev.demo.monitoring;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
@RequestMapping("/")
public class HelloWorldController {
    private static final Logger log = LoggerFactory.getLogger(HelloWorldController.class);

    @GetMapping
    public String hello() {
        log.info("Printing hello and UUID {}", UUID.randomUUID());
        return "ok";
    }
}
