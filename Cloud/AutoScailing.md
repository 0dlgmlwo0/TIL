
# 🚀 AWS Auto Scaling 정리

## 💡 Scaling이란?
- 시스템 성능을 높이기 위해 리소스를 **확장(Scale-Out/Up)** 또는 **축소**하는 것

---

## 📈 스케일링 종류

| 종류         | 설명                     | 장단점                                |
|--------------|--------------------------|----------------------------------------|
| **Scale-Up**   | 서버 성능 업그레이드       | ✔ 단순 설정<br>❌ 물리적 한계, 재시작 필요 |
| **Scale-Out**  | 서버 대수 확장            | ✔ 무중단 확장<br>❌ 복잡한 아키텍처, ELB 필요 |

---

## ⚙️ Auto Scaling이란?
- 트래픽 변화에 따라 서버 수를 **자동 조절**하는 AWS 서비스
- 비용 절감 + 고가용성 유지
- 트래픽 증가 시 자동 확장, 감소 시 자동 축소

---

## 🛠️ Auto Scaling 구성 요소
1. **Launch Template**: 인스턴스 생성 설계도 (AMI, 인스턴스 타입 등)
2. **ASG (Auto Scaling Group)**: 인스턴스 그룹 관리
3. **Scaling Policy**: 확장/축소 규칙
   - Target Tracking / Step Scaling / Scheduled Scaling
4. **CloudWatch**: 모니터링 및 트리거 역할

---

## 🎯 실습 정리

### 실습 1️⃣ 기본 Auto Scaling 설정
- 용량 설정: 최소=2, 최대=2, 원하는=2
- 인스턴스 종료 시 자동 복구 확인

---

### 실습 2️⃣ 동적 크기 조정
- CPU 부하 발생 시 인스턴스 자동 확장
```bash
stress-ng --cpu 2 --timeout 10m --metrics --times
```

---

### 실습 3️⃣ 스케줄링 확장
- 특정 시간대에 EC2 자동 증가 설정

