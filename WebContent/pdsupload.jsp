<%@page import="java.util.Date"%>
<%@page import="javax.xml.crypto.Data"%>
<%@page import="dto.PdsDto"%>
<%@page import="dao.PdsDao"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="java.io.IOException"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%!
// upload 함수
String filename = ""; // 시간으로 된 파일 명
public String processUploadFile(FileItem fileItem, String dir)throws IOException{
	
	String originalfilename = fileItem.getName();	 // 경로 + 파일명
	long sizeInBytes = fileItem.getSize();	 // 크기
	
	if(sizeInBytes > 0) {	// 파일이 정상인가?	// d:\\tem\\abc.txt = d:/tem/abc.txt 
		
		int idx = originalfilename.lastIndexOf("\\");
		
		if(idx == -1){ // 찾지 못하였다.
			idx = originalfilename.lastIndexOf("/");
		}
		
		originalfilename = originalfilename.substring(idx + 1); // 파일명만 받아온다.
		
		idx = originalfilename.lastIndexOf(".");
		
		String bfilename = originalfilename.substring(idx); // . 뒤에 문자를 가져온다.
		
		filename = (new Date().getTime()) + bfilename;
	
		
		File uploadFile = new File(dir, filename);
		
		try{
			
			fileItem.write(uploadFile);	// 실제로 upload되는 부분
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	return originalfilename;	// DB에 저장하기 위한 return
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
// tomcat 베포 - server
String fupload = application.getRealPath("/upload");

// 지정 폴더 - client
// String fupload = "d:\\tep";

System.out.println("업로드 폴더 : " + fupload);

String yourTempDir = fupload;

int yourMaxRequestSize = 100 * 1024 * 1024; // 1 Mbyte
int yourMaxMemorySize = 100 * 1024;			// 1 Kbyte

// form field의 데이터를 저장할 변수
String id = "";
String title = "";
String content = "";
int seq = -1;

// file명 저장
String originalfilename = "";

boolean isMultipart = ServletFileUpload.isMultipartContent(request);
if(isMultipart == true){
	
	// FileItem 생성
	// form 필드에서 받은 자료가 무작위로 오기때문에 어떤 것이 file이고 input 값인지 알수가 없다 이 밑에 코드는 그것을 구분하기위한 준비작업이다.
	DiskFileItemFactory factory = new DiskFileItemFactory();
	
	factory.setSizeThreshold(yourMaxMemorySize);
	factory.setRepository(new File(yourTempDir));
	
	ServletFileUpload upload = new ServletFileUpload(factory);
	upload.setSizeMax(yourMaxRequestSize);
	
	List<FileItem> items = upload.parseRequest(request);
	Iterator<FileItem> it = items.iterator();
	
	while(it.hasNext()){
		
		FileItem item = it.next();
		if(item.isFormField()){ // id, title, content
			if(item.getFieldName().equals("id")){
				id = item.getString("utf-8");
			} 
			else if(item.getFieldName().equals("title")){
				title = item.getString("utf-8");
			} 
			else if(item.getFieldName().equals("content")){
				content = item.getString("utf-8");
			}
			else if(item.getFieldName().equals("seq")){
				seq = Integer.parseInt( item.getString("utf-8").trim() );
			}
		}
		else{	// file
			if(item.getFieldName().equals("fileload")){
				originalfilename = processUploadFile(item, fupload);
			}
		}
	}
}

// DB에 저장
PdsDao dao = PdsDao.getInstance();
System.out.println("filename = " + filename);

if(seq >= 0){
	boolean isS = dao.updatePds(new PdsDto(id, title, content, originalfilename, filename), seq);
	
	if(isS){
	%>
		<script type="text/javascript">
		alert("파일 수정 성공");
		location.href = "pdslist.jsp";
		</script>
	<%
	}else{
	%>
		<script type="text/javascript">
		alert("파일 수정 실패");
		location.href = "pdslist.jsp";
		</script>
	<%	
	}
} else {
	boolean isS = dao.writePds(new PdsDto(id, title, content, originalfilename, filename));

	if(isS){
	%>
		<script type="text/javascript">
		alert("파일 업로드 성공");
		location.href = "pdslist.jsp";
		</script>
	<%
	}else{
	%>
		<script type="text/javascript">
		alert("파일 업로드 실패");
		location.href = "pdslist.jsp";
		</script>
	<%
	}
}
%>
</body>
</html>