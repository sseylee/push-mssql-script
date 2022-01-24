:오늘날짜표시
echo %DATE% git push start.......................

SET giturl=https://github.com/sseylee/push-mssql-script.git
SET branch=master

:현재 디렉토리로 변경
SET cpath=%~dp0
CD /d %cpath%

: .git 폴더 삭제
rm -rf .git

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



