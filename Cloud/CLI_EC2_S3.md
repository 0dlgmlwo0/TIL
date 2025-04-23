
# 🚀 AWS CLI 기반 EC2 + S3 자동화 연동 실습 정리

## 💡 수업 목표
- AWS CLI 사용법 익히기
- UserData 스크립트로 EC2 자동화
- EC2 부팅 시 S3 연동 자동 구성

---

## ⚙️ 실습 흐름
1. **S3 버킷에 `index.php` 업로드**
2. EC2 생성 시 UserData에 자동화 스크립트 삽입
3. EC2 부팅 → Apache & PHP 설치 + S3에서 파일 복사
4. 웹서버 자동 구성 완료

---

## 📜 UserData 스크립트 예시
```bash
#!/bin/bash
yum install httpd php -y
aws s3 cp s3://버킷명/index.php /var/www/html --region ap-northeast-2
systemctl restart httpd
```

---

## 🔧 AWS CLI란?
- 터미널에서 AWS 리소스를 제어할 수 있는 명령줄 도구
- 클릭 없이 명령어로 S3 버킷 생성, 파일 업로드, EC2 실행 가능

---

## 📄 AWS S3 CLI 주요 명령어
| 명령어                                                | 설명               |
|--------------------------------------------------------|--------------------|
| aws s3 ls                                              | 버킷 목록 조회     |
| aws s3 ls s3://버킷명/                                 | 버킷 내 파일 목록  |
| aws s3 cp 로컬경로 s3://버킷명/경로                    | 파일 업로드        |
| aws s3 cp s3://버킷명/경로 로컬경로                    | 파일 다운로드      |
| aws s3 cp s3://버킷명/폴더 ./local-folder --recursive  | 폴더 다운로드     |
| aws s3 cp ./local-folder s3://버킷명/폴더 --recursive  | 폴더 업로드       |
