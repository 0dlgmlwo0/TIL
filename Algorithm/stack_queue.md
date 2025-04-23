
# Stack & Queue 실전 정리 (코딩 테스트 대비)

---

## ✅ 스택 (Stack)
- **LIFO (Last In, First Out)** 구조
- 사용처: DFS, 백트래킹, 괄호 검사

### 📌 실전 예제: 괄호 검사
```python
stack = []
for ch in "(()())":
    if ch == '(':
        stack.append(ch)
    else:
        if stack:
            stack.pop()
        else:
            print("잘못된 괄호")
```

### 📌 실전 예제: 백준 1874 (스택으로 수열 만들기)
- 오름차순 `push()`, 입력값 나오면 `pop()`
- 불가능하면 "NO" 출력

---

## ✅ 큐 (Queue)
- **FIFO (First In, First Out)** 구조
- 사용처: BFS, 프로세스 관리, 실시간 작업

### 📌 실전 예제: 백준 2164 (카드 게임)
```python
from collections import deque

n = 6
queue = deque(range(1, n+1))

while len(queue) > 1:
    queue.popleft()
    queue.append(queue.popleft())
print(queue[0])
```

---

## ✅ Stack vs Queue 비교
| 구분   | 스택            | 큐                |
|--------|-----------------|-------------------|
| 구조   | 후입선출 (LIFO) | 선입선출 (FIFO)   |
| 사용   | DFS, 백트래킹   | BFS, 프로세스 관리|
| Python | list 사용       | deque 사용        |

---

## 💡 실전 팁
- 큐는 `deque` 필수 (속도 문제)
- 스택은 리스트로 충분
- 문제 상황에 맞는 자료구조 선택이 핵심!
