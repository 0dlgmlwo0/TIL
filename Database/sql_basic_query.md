
# 📘 SQL 기초 쿼리 정리

---

## ✅ 1. 데이터베이스와 테이블 생성

```sql
-- 데이터베이스 생성
CREATE DATABASE my_database;

-- 데이터베이스 사용
USE my_database;

-- 테이블 생성
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    age INT
);
```

---

## ✅ 2. 데이터 삽입 (INSERT)

```sql
INSERT INTO users (name, email, age)
VALUES ('홍길동', 'hong@example.com', 25);
```

---

## ✅ 3. 데이터 조회 (SELECT)

```sql
-- 전체 조회
SELECT * FROM users;

-- 특정 컬럼만 조회
SELECT name, age FROM users;

-- 조건에 맞는 데이터 조회
SELECT * FROM users WHERE age > 20;
```

---

## ✅ 4. 데이터 수정 (UPDATE)

```sql
-- id가 1인 사용자의 나이를 30으로 수정
UPDATE users
SET age = 30
WHERE id = 1;
```

---

## ✅ 5. 데이터 삭제 (DELETE)

```sql
-- id가 1인 사용자 삭제
DELETE FROM users
WHERE id = 1;
```

---

## ✅ 6. 조건 및 정렬

```sql
-- 조건 추가
SELECT * FROM users WHERE age >= 20 AND name = '홍길동';

-- 정렬 (오름차순, 내림차순)
SELECT * FROM users ORDER BY age ASC;
SELECT * FROM users ORDER BY age DESC;

-- 제한된 수만 보기
SELECT * FROM users LIMIT 5;
```

---

## ✅ 7. 기타 자주 쓰는 것들

```sql
-- 중복 없이 보기
SELECT DISTINCT age FROM users;

-- 별칭 사용
SELECT name AS 사용자이름 FROM users;

-- BETWEEN (범위 검색)
SELECT * FROM users WHERE age BETWEEN 20 AND 30;

-- LIKE (문자열 패턴 검색)
SELECT * FROM users WHERE name LIKE '홍%';  -- '홍'으로 시작하는 이름
```

---

## 📝 참고

- `VARCHAR(n)` : n개의 문자까지 저장 가능한 문자열 타입  
- `AUTO_INCREMENT` : 자동으로 숫자가 증가함 (기본키에 자주 사용)  
- `PRIMARY KEY` : 각 행(row)의 고유 식별자  
