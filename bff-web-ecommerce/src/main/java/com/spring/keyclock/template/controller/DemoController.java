package com.spring.keyclock.template.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping
@Api(tags="Demo")
public class DemoController {

	@GetMapping
	@ApiOperation(value = "index")
	public ResponseEntity<String> index() {
	    return ResponseEntity.ok("Demo Controller - Hello");
	}

}
