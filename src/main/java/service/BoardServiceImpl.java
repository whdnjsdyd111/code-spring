package service;

import domain.BoardVO;
import domain.Criteria;
import lombok.AllArgsConstructor;
import lombok.extern.java.Log;
import mapper.BoardMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Log
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
    // spring 4.3 이상에서 자동 처리
    private BoardMapper mapper;

    @Override
    public void register(BoardVO board) {
        log.info("register ..." + board);

        mapper.insertSelectKey(board);
    }

    @Override
    public BoardVO get(Long bno) {
        log.info("get......" + bno);

        return mapper.read(bno);
    }

    @Override
    public List<BoardVO> getList(Criteria cri) {
        log.info("get list with criteria: " + cri);

        return mapper.getListWithPaging(cri);
    }

    @Override
    public boolean modify(BoardVO board) {
        log.info("modify ......" + board);

        return mapper.update(board) == 1;
    }

    @Override
    public boolean remove(Long bno) {
        log.info("remove ......" + bno);

        return mapper.delete(bno) == 1;
    }

    @Override
    public List<BoardVO> getList() {
        log.info("getList.............");

        return mapper.getList();
    }

    @Override
    public int getTotal(Criteria cri) {
        log.info("get total count");

        return mapper.getTotalCount(cri);
    }
}
