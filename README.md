# push-mssql-script.bat
- MSSQL의 특정 데이터베이스의 모든 객체(데이터제외)들의 변경 이력을 git으로 형상 관리하기 위한 목적으로 만들어짐
- 윈도우환경에서 작업스케줄러를 이용하여 bat파일을 실행
- 파이썬의 <a href="https://github.com/Microsoft/mssql-scripter" target="_blank">mssql-scripter</a> 패키지 사용하므로 파이썬이 설치되어 있어야 함
- 실행방법
  <code>push-mssql-script.bat [server] [dbname] [uid] [pwd] [giturl] [branch] </code>
  - DB정보와 git정보를 BAT파일 실행시 옵션으로 전달해줘야 합니다.
  - 파일이 실행한 위치의 디렉토리에 DB폴더가 생성된후 테이블/프로시저/뷰등의 스크립트 파일이 SQL로 생성이 완료된 후
    현재 디렉토리에 위치한 전체 파일을 git으로 push 합니다. 
 
