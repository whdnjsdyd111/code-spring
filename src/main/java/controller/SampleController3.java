package controller;

import lombok.extern.java.Log;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Log
@RequestMapping("/sample3/*")
@Controller
public class SampleController3 {
    @GetMapping("/all")
    public void doAll() {
        log.info("do all can access everybody");
    }

    @GetMapping("/member")
    public void doMember() {
        log.info("logined member");
    }

    @GetMapping("/admin")
    public void doAdmin() {
        log.info("admin only");
    }

    @PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MEMBER')")
    @GetMapping("/annoMember")
    public void doMember2() {
        log.info("logined annotation member");
    }

    @Secured({"ROLE_ADMIN"})
    @GetMapping("/annoAdmin")
    public void doAdmin2() {
        log.info("admin annotation only");
    }
}
