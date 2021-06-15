package com.itwillbs.board;

import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
	//Data Access Object => itwill_board 테이블 정보 처리객체.
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	
		// DB연결 메서드 - 커넥션풀 사용
		// DB연결정보 (Connection)를 미리 생성해서 pool에 저장.
		// 사용시 연결정보 대여, 사용후 반납처리 (기본처리 로직: 대기 -> 생성후 반납.)
		//1. 라이브러리 설치
		//2. Context.xml파일 생성. DB연결정보
		//3. Context.xml파일 호출해  DB연결.
								//호출한꼿으로 예외 던진다(throw)
		private Connection getCon() throws Exception{
			// 프로젝트정보 초기화
			//Context는 인터페이스 이지만 upcast'통해 사용가능.
			Context initCTX = new InitialContext();
			
			//프로젝트에 있는 디비연결정보(이름)불로오기
			//context.xml의 type이 DataSource
			//java:comp/env/[context.xml의 name]
			DataSource ds =
					(DataSource) initCTX.lookup("java:comp/env/jdbc/mysqlDB");
			//디비연결
			con = ds.getConnection();
			System.out.println("DAO : DB연결성공! "+con);
			
			return con;
		}  
		
		//자원해제
		public void closeDB(){
			try {
				if(rs !=null) rs.close();
				if(pstmt !=null) pstmt.close();
				if(con !=null) con.close();
				
			} catch (SQLException e) {				
				e.printStackTrace();			
			}			
		}
	
	//글쓰기 메서드 - insertBoard() 
	//try-catch는 문제발생하더라도  이후코드를 실행한다.  비정상종료(뻗었다) 방지.
	public void insertBoard(BoardBean bb){
//		final String DRIVER = "com.mysql.jdbc.Driver";
//		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
//	    final String DBID = "root";
//	    final String DBPW = "1234";
	    
	    int num=0;	//계산된 글번호 저장
	    
	    try {
	    	// 1. 드라이버 로드
//			Class.forName(DRIVER);
			// 2. 디비연결
//			Connection con = DriverManager.getConnection(DBURL,DBID,DBPW);
			
	    	//1.2 DB연결(CP)
	    	Connection con = getCon();	//try 처리
	    	
			//3.  sql(select) & pstmt 객체\
			
			//게시판 번호(num)  계산
			//select max(num) from itwill_board;	//컬럼데이터 갯수
			// => rs.next 함수실행시 데이터가 없더라도 null값이 있으므로 화살표나옴.: 무조건 true 
			// => 함수의 결과는 항상 커서가 존재함(데이터 유무와 상관없음)  (화살표 모양)
       		//     
			//참고 select num from itwill_board;  (컬럼data select)
			// => rs.next : false
			// => 함수의 결과가 데이터의 유무에 따라서 커서유무 결정 (원 모양)
			String sql = "select max(num) from itwill_board";
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			// 4. sql 실행
					ResultSet rs = pstmt.executeQuery();
					
			//5. data처리
				if (rs.next()) {
//					rs.getInt("max(num)");
					num = rs.getInt(1)+1;   //getInt(column index)
				}
//				else{ num = 1;	//rs.next()없는경우 }
				
				System.out.println("DAO : 글번호: "+num);
			
				// 3. sql(insert) & pstmt 객체 생성
				sql = "insert into itwill_board (num,name,pass,subject,content,"
					+ "readcount,re_ref,re_lev,re_seq,date,ip,file) "
					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
					//now()함수:  시스템시간 
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.setString(2, bb.getName());
				pstmt.setString(3, bb.getPass());
				pstmt.setString(4, bb.getSubject());
				pstmt.setString(5, bb.getContent());
				pstmt.setInt(6, 0);   //form에서 넘어온게 아니므로  조회수 임의값 0
				pstmt.setInt(7, num); // re_ref 답글 그룹번호 / 일반글번호 == 그룹번호
				pstmt.setInt(8, 0); //re_lev 답글 들여쓰기 / 일반글 들여쓰기 없음 (0)
				pstmt.setInt(9, 0); //re_seq 답글 순서  / 일반글 0
				pstmt.setString(10, bb.getIp());
				pstmt.setString(11, bb.getFile());
				
				
				// 4. sql 실행
				pstmt.executeUpdate();
				
				System.out.println("DAO : 게시글 작성 완료! ");				
				
					
	    } catch (ClassNotFoundException e) {
	    	e.printStackTrace();
	    	System.out.println("DAO : 드라이버로드 실패");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DAO : dB연결 실패");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
	    
	} //글쓰기 메서드 - insertBoard()
	
	
	//getBoardCount()
	public int getBoardCount(){
		int cnt =0;
		
		//1.2 DB연결(CP)
		try {
			con = getCon();	//try 처리
			
		//3.  sql(select) & pstmt 객체
		sql = "select count(*) from itwill_board";
		pstmt = con.prepareStatement(sql);
		
		// 4. sql 실행
		rs = pstmt.executeQuery();
		
		//5.데이터처리
		if(rs.next()){
			cnt = rs.getInt(1);		//index  컬럼명보다 속도 빠름.
//			cnt = rs.getInt("count(*)");
		}
		
		System.out.println("DAO : 글갯수확인 "+cnt);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			closeDB();
		}			
		return cnt;
		
	}//getBoardCount()
	
	//getBoardList()
	public ArrayList getBoardList(){
		//ArrayList 가변길이 배열(자동으로 배열의 크기를 지정)
		
		ArrayList boardList = new ArrayList();
		//1.2 DB연결(CP)
			try {
				con = getCon();				
			//3.  sql(select) & pstmt 객체
			sql = "select * from itwill_board";
			pstmt = con.prepareStatement(sql);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				// 글1개 정보저장
				BoardBean bb = new BoardBean();
				
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getDate("date"));
				bb.setIp(rs.getString("ip"));
				
				//글정보를 배열에 1칸저장
				boardList.add(bb);
			}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return boardList;
		
	}
	//getBoardList()
	
	
	
	
	
	
}
