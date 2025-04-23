
# Queue & Deque 심화 정리 (6주차)

---

## ✅ 큐 (Queue)
- **FIFO (First In, First Out)** 구조
- 파이썬: `collections.deque` 사용
```python
from collections import deque
q = deque()
q.append(1)
q.popleft()
```
- 📌 활용: BFS, 프로세스 관리

---

## ✅ 덱 (Deque)
- **Double-Ended Queue**
- 양쪽 끝에서 삽입/삭제 가능

### 🔹 주요 연산
| 연산            | 설명            |
|-----------------|-----------------|
| append(x)       | 오른쪽 끝 삽입  |
| appendleft(x)   | 왼쪽 끝 삽입    |
| pop()           | 오른쪽 끝 삭제  |
| popleft()       | 왼쪽 끝 삭제    |

### 🔹 활용 예시
- Undo / Redo 기능
- 웹 브라우저 방문 기록
- 슬라이딩 윈도우 알고리즘

```python
dq = deque([1, 2, 3])
dq.appendleft(0)
dq.pop()
```

---

## ✅ Stack vs Queue vs Deque

| 자료구조 | 삽입 위치 | 삭제 위치 | 사용 예시         |
|----------|-----------|-----------|-------------------|
| 스택     | 한쪽      | 한쪽      | DFS, 백트래킹     |
| 큐       | 뒤        | 앞        | BFS, 작업 대기열  |
| 덱       | 양쪽      | 양쪽      | Undo/Redo, 슬라이딩 윈도우 |

