package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DBClose;
import db.DBConnection;
import dto.PdsDto;

public class PdsDao {
	private static PdsDao dao = new PdsDao();
	
	private PdsDao() {
		
	}
	
	public static PdsDao getInstance() {
		return dao;
	}
	
	public List<PdsDto> getPdsList(){
		
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, "
				+ " ORIFILENAME, FILENAME, READCOUNT, DOWNCOUNT, REGDATE "
				+ " FROM PDS "
				+ " ORDER BY SEQ DESC ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<PdsDto> list = new ArrayList<PdsDto>();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 S getPdsList");
			
			psmt = conn.prepareStatement(sql);
			System.out.println("2/4 S getPdsList");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 S getPdsList");
			
			while(rs.next()) {
				int i=1;
				
				list.add(new PdsDto(rs.getInt(i++),
									rs.getString(i++),
									rs.getString(i++),
									rs.getString(i++),
									rs.getString(i++),
									rs.getString(i++),
									rs.getInt(i++),
									rs.getInt(i++),
									rs.getString(i++)));
									
				
			}
			System.out.println("4/4 S getPdsList");
			
		} catch (SQLException e) {
			System.out.println("Fail getPdsList");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return list;
	}
	
	public PdsDto getPds(int seq){
		
		String sql = " SELECT SEQ, ID, TITLE, CONTENT, "
				+ " ORIFILENAME, FILENAME, READCOUNT, DOWNCOUNT, REGDATE "
				+ " FROM PDS "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		PdsDto dto = new PdsDto();
		
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/4 S getPdsList");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/4 S getPdsList");
			
			rs = psmt.executeQuery();
			System.out.println("3/4 S getPdsList");
			
			if(rs.next()) {
				int i=1;
				
				dto = new PdsDto(rs.getInt(i++),
									rs.getString(i++),
									rs.getString(i++),
									rs.getString(i++),
									rs.getString(i++),
									rs.getString(i++),
									rs.getInt(i++),
									rs.getInt(i++),
									rs.getString(i++));
									
				
			}
			System.out.println("4/4 S getPdsList");
			
		} catch (SQLException e) {
			System.out.println("Fail getPdsList");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, rs);
		}
		
		return dto;
	}
	
	public boolean writePds(PdsDto pds) {
		String sql = " INSERT INTO PDS(SEQ, ID, TITLE, CONTENT, ORIFILENAME, FILENAME, "
					+ " READCOUNT, DOWNCOUNT, REGDATE) "
					+ " VALUES(SEQ_PDS.NEXTVAL, ?, ?, ?, ?, ?, "
					+ " 0, 0, SYSDATE) ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		int count = 0;
	
		try {
			conn = DBConnection.getConnection();
			System.out.println("1/3 S writePds");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pds.getId());
			psmt.setString(2, pds.getTitle());
			psmt.setString(3, pds.getContent());
			psmt.setString(4, pds.getOrginalFileName());
			psmt.setString(5, pds.getFilename());
			
			System.out.println("2/3 S writePds");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 S writePds");
		} catch (SQLException e) {
			System.out.println("Fail writePds");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return count>0?true:false;
	}
	
	public void downcount(int seq) {
		String sql = " UPDATE PDS "
				+ " SET DOWNCOUNT=DOWNCOUNT+1 "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			
			conn = DBConnection.getConnection();
			System.out.println("1/3 S downcount");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/3 S downcount");
			
			psmt.executeUpdate();
			System.out.println("3/3 S downcount");
			
		} catch (SQLException e) {
			System.out.println("Fail downcount");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
	}
	
	public void readcount(int seq) {
		String sql = " UPDATE PDS "
				+ " SET READCOUNT=READCOUNT+1 "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		try {
			
			conn = DBConnection.getConnection();
			System.out.println("1/3 S readcount");
			
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			System.out.println("2/3 S readcount");
			
			psmt.executeUpdate();
			System.out.println("3/3 S readcount");
			
		} catch (SQLException e) {
			System.out.println("Fail readcount");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
	}
	
	public boolean updatePds(PdsDto pds, int seq) {
		String sql = " UPDATE PDS "
				+ " SET TITLE=?, CONTENT=?, ORIFILENAME=?, FILENAME=? "
				+ " WHERE SEQ=? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		
		int count = 0;
		
		try {
			
			conn = DBConnection.getConnection();
			System.out.println("1/3 S updatePds");
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pds.getTitle());
			psmt.setString(2, pds.getContent());
			psmt.setString(3, pds.getOrginalFileName());
			psmt.setString(4, pds.getFilename());
			psmt.setInt(5, seq);
			
			System.out.println("2/3 S updatePds");
			
			count = psmt.executeUpdate();
			System.out.println("3/3 S updatePds");
			
		} catch (SQLException e) {
			System.out.println("Fail updatePds");
			e.printStackTrace();
		} finally {
			DBClose.close(conn, psmt, null);
		}
		
		return count>0?true:false;
	}
}