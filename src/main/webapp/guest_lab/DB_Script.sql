
-- 23.01.16
/*
 폰 컬럼의 레코드를 선택했을때 read.jsp페이지로 가면 del(삭제), upd(수정).jsp 가능한 만들기.. 
 패스워드는 메일주소로
 guestlab_read.jsp <- id, page변수 두개 던져줘야함
 guestlab_del.jsp
 guestlab_upd.jsp
 */



-- 23.01.13
/*
 	save를 list에 던져줌..?
 	guestlab_list.jsp <- 생성
 	
 	===================================
 	번호		메일 		폰 		성별 		주소 
 	===================================
 	30(idx)	aaa@com(ename)	010-1111-1111(phone) 남자(gender) 	서울(addr)
 	29	aaa@com	010-1111-1111 남자	서울
 	28	aaa@com	010-1111-1111 남자	서울
 	27	aaa@com	010-1111-1111 남자	서울
 	26	aaa@com	010-1111-1111 남자	서울
 	===================================
 		[처음][이전] 1 2 3 4 5 [다음][끝]
 	tr 돌려서 db에 있는 값 레코드로 출력하고 5개씩 페이징 위에처럼 출력되게
 	페이
 	
 	
 	
 */





-- 2023.01.11
-- Oracle XE DataBase에서 Table 생성

Create Table guestlab (

	idx varchar2(200) primary key,
	ename varchar2(200),
	phone varchar2(200),
	gender varchar2(200),
	addr varchar2(200)
	);
	
	
	
-- 1. 라이브러리 WEB-INF\lib 라이브러리 넣기

-- 2. Oracle DB 연결 설정 
	
-- 3. 폼페이지를 생성해야함. guestlab_write.html
	
-- 4. form에서 action을 처리하는 페이지 생성 guestlab_save.jsp
	-- 폼에서 넣는 값을 받아서 DB에 저장하는 페이지
	
	--23.01.11
/*
  guestlab_show.jsp //rs에서 값을 가져와서 출력 
  guestlab02_show.jsp //rs에서 값을 벡터에 저장후 출력 
  guestlab03_show.jsp //rs에서 값을 어레이리스트에 저장후 출력 
 
 */
	
	
	
