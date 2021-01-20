package controller;

import domain.Sample2VO;
import domain.Ticket;
import lombok.extern.java.Log;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

@RestController
@RequestMapping("/sample2")
@Log
public class SampleController2 {

    @GetMapping(value = "/getText", produces = "text/plain; charset=UTF-8")
    public String getText() {
        log.info("MIME TYPE: " + MediaType.TEXT_PLAIN_VALUE);

        return "안녕하세요";
    }

    @GetMapping(value = "/getSample", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE,
            MediaType.APPLICATION_XML_VALUE })
    public Sample2VO getSample() {
        return new Sample2VO(112, "스타", "로드");
    }

    @GetMapping(value = "/getList")
    public List<Sample2VO> getList() {
        return IntStream.range(1, 10).mapToObj(i -> new Sample2VO(i, i + "First", i + " Last"))
                .collect(Collectors.toList());
    }

    @GetMapping(value = "/getMap")
    public Map<String, Sample2VO> getMap() {
        Map<String ,Sample2VO> map = new HashMap<>();
        map.put("First", new Sample2VO(111, "그루트", "주니어"));

        return map;
    }

    @GetMapping(value = "/check", params = {"height", "weight"})
    public ResponseEntity<Sample2VO> check(Double height, Double weight) {
        Sample2VO vo = new Sample2VO(0, "" + height, "" + weight);

        ResponseEntity<Sample2VO> result = null;

        if(height < 150) {
            result = ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(vo);
        } else {
            result = ResponseEntity.status(HttpStatus.OK).body(vo);
        }

        return result;
    }

    @GetMapping("/product/{cat}/{pid}")
    public String[] getPath(
            @PathVariable("cat") String cat,
            @PathVariable("pid") Integer pid) {
        return new String[] { "category: " + cat, "productid: " + pid };
    }

    @PostMapping("/ticket")
    public Ticket convert(@RequestBody Ticket ticket) {
        log.info("convert ... ticket " + ticket);

        return ticket;
    }
}
