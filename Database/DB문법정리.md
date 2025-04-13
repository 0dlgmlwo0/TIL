# 📘 MariaDB 문법 정리

## 📂 데이터베이스 관리

### 데이터베이스 생성
```sql
CREATE DATABASE dbname;
```

### 데이터베이스 삭제
```sql
DROP DATABASE dbname;
```

### 데이터베이스 사용
```sql
USE dbname;
```

---

## 📄 테이블 관리

### 테이블 생성
```sql
CREATE TABLE tablename (
    column1 datatype [constraints],
    column2 datatype [constraints],
    ...
);
```

예:
```sql
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

### 테이블 보기
```sql
SHOW TABLES;
```

### 테이블 구조 확인
```sql
DESCRIBE tablename;
```

### 테이블 삭제
```sql
DROP TABLE tablename;
```

### 테이블 수정
```sql
-- 컬럼 추가
ALTER TABLE tablename ADD column_name datatype;

-- 컬럼 삭제
ALTER TABLE tablename DROP column_name;

-- 컬럼 변경
ALTER TABLE tablename MODIFY column_name new_datatype;

-- 컬럼 이름 변경
ALTER TABLE tablename CHANGE old_column new_column datatype;
```

---

## 🧾 데이터 조작 (CRUD)

### 데이터 삽입
```sql
INSERT INTO tablename (col1, col2, ...) VALUES (val1, val2, ...);
```

### 데이터 조회
```sql
SELECT * FROM tablename;
SELECT col1, col2 FROM tablename WHERE condition;
```

조건 예시:
```sql
WHERE age > 18 AND city = 'Seoul'
```

정렬:
```sql
ORDER BY column [ASC|DESC]
```

제한:
```sql
LIMIT 10 OFFSET 5;
```

### 데이터 수정
```sql
UPDATE tablename SET col1 = val1 WHERE condition;
```

### 데이터 삭제
```sql
DELETE FROM tablename WHERE condition;
```

---

## 🔗 제약 조건 (Constraints)

- `PRIMARY KEY`
- `UNIQUE`
- `NOT NULL`
- `DEFAULT`
- `FOREIGN KEY (col) REFERENCES other_table(col) ON DELETE CASCADE`

---

## 🔎 조인 (JOIN)

조인은 두 개 이상의 테이블에서 관련된 데이터를 결합할 때 사용합니다.

### 기본 구조
```sql
SELECT A.col1, B.col2
FROM tableA AS A
JOIN tableB AS B
ON A.common_col = B.common_col;
```

### 🔹 INNER JOIN (교집합)
두 테이블에 모두 존재하는 데이터만 출력
```sql
SELECT * FROM employees
INNER JOIN departments ON employees.dept_id = departments.id;
```

### 🔹 LEFT JOIN (왼쪽 기준 전체 + 오른쪽 일치 데이터)
왼쪽 테이블은 모두 출력, 오른쪽 테이블은 일치하는 경우만 출력
```sql
SELECT * FROM employees
LEFT JOIN departments ON employees.dept_id = departments.id;
```

### 🔹 RIGHT JOIN (오른쪽 기준 전체 + 왼쪽 일치 데이터)
오른쪽 테이블은 모두 출력, 왼쪽 테이블은 일치하는 경우만 출력
```sql
SELECT * FROM employees
RIGHT JOIN departments ON employees.dept_id = departments.id;
```

### 🔹 FULL OUTER JOIN (합집합) *(MariaDB에서는 직접 지원 안 됨)*
```sql
-- FULL OUTER JOIN은 UNION으로 흉내낼 수 있음
SELECT * FROM employees
LEFT JOIN departments ON employees.dept_id = departments.id
UNION
SELECT * FROM employees
RIGHT JOIN departments ON employees.dept_id = departments.id;
```

### 🔹 SELF JOIN (자기 자신과 조인)
```sql
SELECT A.name AS employee, B.name AS manager
FROM employees A
JOIN employees B ON A.manager_id = B.id;
```

### 🔹 CROSS JOIN (모든 조합)
```sql
SELECT * FROM products
CROSS JOIN categories;
```

> 📌 **TIP**: 조인 시 `ON` 절을 활용하여 연결 조건을 명확히 지정해야 합니다. `WHERE` 절과 함께 사용하면 필터링도 가능해요.



## 🧮 집계 함수

```sql
SELECT COUNT(*), AVG(col), MAX(col), MIN(col), SUM(col) FROM tablename;
```

그룹화:
```sql
GROUP BY column;
HAVING 조건;
```

---

## ⚙️ 인덱스

### 인덱스 생성
```sql
CREATE INDEX index_name ON tablename(column);
```

### 인덱스 보기
```sql
SHOW INDEX FROM tablename;
```

### 인덱스 삭제
```sql
DROP INDEX index_name ON tablename;
```

---

## 👥 사용자 및 권한

### 사용자 생성
```sql
CREATE USER 'username'@'host' IDENTIFIED BY 'password';
```

### 권한 부여
```sql
GRANT ALL PRIVILEGES ON dbname.* TO 'username'@'host';
```

### 권한 적용
```sql
FLUSH PRIVILEGES;
```

### 사용자 삭제
```sql
DROP USER 'username'@'host';
```

---

## ⏳ 트랜잭션

```sql
START TRANSACTION;
-- SQL 작업
COMMIT; -- 저장
ROLLBACK; -- 취소
```

---

## 📌 기타 유용한 명령어

### 현재 데이터베이스 확인
```sql
SELECT DATABASE();
```

### 현재 사용자 확인
```sql
SELECT USER();
```

### 현재 시간
```sql
SELECT NOW();
```

---

> ✅ *MariaDB는 MySQL과 거의 동일한 문법을 사용합니다. 대부분의 MySQL 문법이 그대로 적용됩니다.*