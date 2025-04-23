
# ⚖️ AWS ELB 정리 (Elastic Load Balancer)

## 💡 ELB란?
- AWS의 **트래픽 분산 서비스**
- EC2, 컨테이너, IP, Lambda 등에 트래픽 자동 분산
- 고가용성, AutoScaling 연동 가능
- **도메인 기반 접속** (IP 고정 불가)

---

## 🚀 ELB 주요 특징
- **Health Check**로 인스턴스 상태 점검
- 여러 **가용영역(AZ)** 지원
- **ELB 타입**
| 타입                        | 특징                    |
|-----------------------------|-------------------------|
| Application Load Balancer   | 경로 기반, 스마트 라우팅 |
| Network Load Balancer       | 빠른 TCP 트래픽 분산    |
| Classic Load Balancer       | 구버전                  |

---

## 🎯 ALB (Application Load Balancer)
- **Target Group**: 트래픽 분산 대상 그룹
- 라우팅 규칙 기반 요청 분배
- 헬스체크, 포트/프로토콜 설정 가능

---

## 🛠️ 실습 정리

### 실습 1️⃣ ALB 생성
1. 시작 템플릿 수정 (UserData 스크립트 추가)
2. EC2 인스턴스 2대 생성
3. Target Group 생성 후 EC2 등록
4. ALB 생성 및 리스너 설정 (포트 80)

---

### 실습 2️⃣ 경로 기반 리디렉션
- `/s3` 요청 시 S3 버킷으로 리디렉션
- **S3 설정**
  - 정적 웹사이트 호스팅 활성화
- **ALB 설정**
  - 리스너 규칙 추가
  - 경로: `/s3` → S3 엔드포인트로 리디렉션 (상태코드 302)

