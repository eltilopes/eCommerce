package com.spring.keyclock.template.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@Api(tags="Security Controller")
@RequestMapping(value = "/security")
public class SecurityController {

    /**
     * endpoint sem nenhuma validação de role 
     */
    @GetMapping
	@ApiOperation(value = "isAuthenticated")
    public ResponseEntity<Void> isAuthenticated() {
    	System.out.print("Cuida");
        return ResponseEntity.ok().build();
    }

    /**
     * endpoint onde o usuario tem que ter a role user
     */
    @GetMapping(value = "/has-role")
	@ApiOperation(value = "isUser")
    @PreAuthorize("hasAnyAuthority('ROLE_USER')")
    public ResponseEntity<Void> isUser() {
        return ResponseEntity.ok().build();
    }

    /**
     * endpoint onde o usuario tem que ter a role admin
     */
    @GetMapping(value = "/is-admin")
	@ApiOperation(value = "isAdmin")
    @PreAuthorize("hasAnyAuthority('ROLE_ADMIN')")
    public ResponseEntity<Void> isAdmin() {
        return ResponseEntity.ok().build();
    }

}	