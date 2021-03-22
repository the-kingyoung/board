package board.a03_dao;

import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import board.z01_vo.Board;
// board.a03_dao.A01_BoardDao
@Repository
public interface A01_BoardDao {
	public ArrayList<Board> boardList(Board sch);
}
