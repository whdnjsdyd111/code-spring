package service;

import domain.BoardAttachVO;
import domain.BoardVO;
import domain.Criteria;

import java.util.List;

public interface BoardService {
    public void register(BoardVO board);

    public BoardVO get(Long bno);

    public boolean modify(BoardVO board);

    public boolean remove(Long bno);

    public List<BoardVO> getList();

    public List<BoardVO> getList(Criteria cri);

    public int getTotal(Criteria cri);

    public List<BoardAttachVO> getAttachList(Long bno);
}
