# SQL SELECT & JOIN 개념 정리

---

## 🟦 SELECT 문이란?

> 데이터베이스에서 원하는 데이터를 조회하는 SQL 명령어

### ✅ 기본 문법

```sql
SELECT 컬럼1, 컬럼2, ...
FROM 테이블명
WHERE 조건
ORDER BY 정렬기준
LIMIT 개수;
```

### 📌 예제

```sql
SELECT name, hospital_code
FROM hospital_detail
WHERE region = '성남시'
ORDER BY name ASC;
```

---

## 🟩 JOIN이란?

> 두 개 이상의 테이블을 기준 컬럼을 통해 연결하여 하나의 결과로 합치는 방식

---

## 🔄 JOIN 종류와 특징

| JOIN 종류       | 설명                                             | 주로 사용 상황 |
|----------------|--------------------------------------------------|----------------|
| INNER JOIN     | 양쪽 테이블 모두에 있는 데이터만 반환            | 일치하는 데이터만 보고 싶을 때 |
| LEFT JOIN      | 왼쪽 테이블은 전부, 오른쪽은 일치하는 데이터만   | 기본 테이블 기준 전체 목록이 필요할 때 |
| RIGHT JOIN     | 오른쪽 테이블은 전부, 왼쪽은 일치하는 데이터만   | 반대 방향 LEFT JOIN (MySQL에서 잘 안 씀) |
| FULL OUTER JOIN| 양쪽 테이블의 모든 데이터를 반환                 | 모두 다 보고 싶을 때 (MySQL은 UNION으로 대체) |
| SELF JOIN      | 같은 테이블을 두 번 연결                         | 자기 자신 비교 |
| CROSS JOIN     | 곱집합 (모든 조합) 생성                          | 매우 특수한 경우만 사용 |

---

## 📘 INNER JOIN 예제

```sql
SELECT h.name, e.equipment_count
FROM hospital_detail h
INNER JOIN equipment_info e
ON h.hospital_code = e.hospital_code;
```

✅ 두 테이블에서 `hospital_code`가 일치하는 병원만 조회

---

## 📗 LEFT JOIN 예제

```sql
SELECT h.name, e.equipment_count
FROM hospital_detail h
LEFT JOIN equipment_info e
ON h.hospital_code = e.hospital_code;
```

✅ 모든 병원 목록은 보되, 장비 정보가 없는 경우는 NULL로 표시

---

## ✅ 정리 요약

- SELECT는 **데이터 조회**
- JOIN은 **테이블을 연결**
- JOIN에서 중요한 건 **기준 컬럼 (보통 코드/ID)** 이 일치하는지 확인

