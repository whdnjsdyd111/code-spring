package security;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/security-context.xml"})
// @ContextConfiguration(classes = {RootConfig.class})
@Log4j
public class PasswordEncoderTests {
    @Setter(onMethod_ = @Autowired)
    private PasswordEncoder pwEncoder;

    @Test
    public void testEncode() {
        String str = "member";

        String enStr = pwEncoder.encode(str);

        // 패스워드 인코딩 결과는 매번 달라질 수 있다.
        log.info(enStr);
    }
}
