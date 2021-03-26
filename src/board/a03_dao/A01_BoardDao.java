package board.a03_dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Repository;

import board.z01_vo.Board;
import board.z01_vo.BoardFile;
import board.z01_vo.BoardSch;
// board.a03_dao.A01_BoardDao
@Repository
public interface A01_BoardDao {
	public int totCnt(BoardSch sch);
	public ArrayList<Board> boardList(BoardSch sch);
	public void insertBoard(Board insert);
	public void uploadFile(BoardFile ins);
	public Board getBoard(int no);	//왜 보드를 쓰는거지
	public ArrayList<BoardFile> getBoardFile(int no);
	public ArrayList<BoardFile> fileInfo(int no);
	public void uptReadCnt(int no);
	public void updateBoard(Board upt);
	public void updateFile(HashMap<String, String> hs);
	public void deleteBoard(int no);
	public void deleteFile(int no);
}
