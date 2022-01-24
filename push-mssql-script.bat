:오늘날짜표시
echo %DATE% git push start.......................

:DB로그인 정보, 배치파일실행서 인수값으로 전달받음. 
SET server=%1
SET dbname=%2
SET uid=%3
SET pwd=%4
SET giturl=%5
SET branch=%6

:현재 디렉토리로 변경
SET cpath=%~dp0
CD /d %cpath%

: .git 폴더 삭제
rm -rf .git

:DB저장디렉토리
SET dbpath=%cpath%%dbname%

:지정한 데이터베이스 폴더 밑에 이미 저장된 파일들이 있으면 삭제
if exist %dbpath% del /S /Q %dbpath%\*.* 

:현재디렉토리에 DBNAME으로 하위폴더를 만들어 객체별 스크립트를 생성함
call mssql-scripter -S %server% -d %dbname% -U %uid% -P %pwd% --exclude-headers --disable-schema-qualification --script-create --include-dependencies --file-per-object --file-path %dbpath%

:현재 폴더를 로컬 Git 저장소로 설정 후 원격저장소의 내용과 합침
git init
git remote add origin %giturl%
git fetch
git reset --mixed origin/%branch%

:현재상태 표시 
git status

:LF will be replaced by CRLF in ... 경고메시지 해결
git config --global core.autocrlf true

:원격저장소목록 보기 
git remote -v

:현재 디렉토리내 파일 추가 && 현재날짜, 시간으로 commit
git add -A . && git commit -m "%date% %time% commit"

:원격저장소에 push => git push
git push origin %branch%



