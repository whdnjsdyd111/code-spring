package security;

import lombok.extern.java.Log;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Log
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                        Authentication auth) throws IOException, ServletException {
        log.warning("Login Success");

        List<String> roleNames = new ArrayList<>();

        auth.getAuthorities().forEach(authority -> {
            roleNames.add(authority.getAuthority());
        });

        log.warning("ROLE NAMES: " + roleNames);

        if(roleNames.contains("ROLE_ADMIN")) {
            response.sendRedirect("/sample3/admin");
            return;
        }

        if(roleNames.contains("ROLE_MEMBER")) {
            response.sendRedirect("/sample3/member");
            return;
        }

        response.sendRedirect("/");
    }
}
