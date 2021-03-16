package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.BbsDto;

public class BbsDao {
	
	private static BbsDao dao = new BbsDao();
	
	private BbsDao() {
	}
	
	public static BbsDao getInstance() {
		return dao;
	}
	
	
	public List<BbsDto> getBbsList() {
		
		String sql = " SELECT SEQ, ID, REF, STEP, DEPTH, "
				+ " TITLE, CONTENT, WDATE, "
				+ " DEL, READCOUNT "
				+ " FROM BBS "
				+ " ORDER BY REF DESC, STEP ASC "; // 최신글을 가장 앞으로 보내는 방법
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BbsDto> list = new ArrayList<BbsDto>();
		
		try {
			
			conn = DBConnection.getConnection();
			System.out.println("1/4 getBbsList");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 getBbsList");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 getBbsList");
			
			while(rs.next()) {
				BbsDto dto = new BbsDto(rs.getInt(1), rs.getString(2), 
										rs.getInt(3), rs.getInt(4), rs.getInt(5),
										rs.getString(6), rs.getString(7), rs.getString(8),
										rs.getInt(9), rs.getInt(10));
				
				list.add(dto);
				
			}
			System.out.println("4/4 getBbsList");
		} catch (SQLException e) {
			System.out.println("getBbsList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;
	}
	
	public boolean addBbslist(BbsDto dto) {
		String sql = " INSERT INTO BBS( SEQ, ID, REF, STEP, DEPTH, "
				+ " TITLE, CONTENT, WDATE, "
				+ " DEL, READCOUNT) "
				+ " VALUES(SEQ_BBS.NEXTVAL, ?, 0, 0, 0, ?, ?, SYSDATE, 0, 0) ";
				
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int count = 0;
		List<BbsDto> list = new ArrayList<BbsDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 addBbslist");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/3 addBbslist");
			
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());

			count = psmt.executeUpdate();
			System.out.println("3/3 addBbslist");
		} catch (SQLException e) {
			System.out.println("getBbsList fail");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return count>0?true:false;
	}
	
	public BbsDto getContent(int sqlnum) {
		String sql = " SELECT * "
				+ " FROM BBS "
				+ " WHERE SEQ = " + sqlnum + " ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		int count = 0;
		BbsDto setDto = new BbsDto();
		
		try {
			conn = DBConnection.getConnection();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			if(rs.next()) {

			String id = rs.getString("id");
			String date = rs.getString("wdate");
			String title = rs.getString("title");
			String content = rs.getString("content");
			
			setDto = new BbsDto(sqlnum, id, 0, 0, 0, title, content, date, 0, 0);
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return setDto;
	}
}









