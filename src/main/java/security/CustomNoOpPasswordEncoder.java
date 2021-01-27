package security;

import lombok.extern.java.Log;
import org.springframework.security.crypto.password.PasswordEncoder;

@Log
public class CustomNoOpPasswordEncoder implements PasswordEncoder {

    @Override
    public String encode(CharSequence rawPassword) {
        log.warning("before encode: " + rawPassword);

        return rawPassword.toString();
    }

    @Override
    public boolean matches(CharSequence rawPassword, String encodedPassword) {
        log.warning("matched: " + rawPassword + ": " + encodedPassword);

        return rawPassword.toString().equals(encodedPassword);
    }
}
