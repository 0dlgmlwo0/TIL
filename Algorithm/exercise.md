
# 📂 연결 리스트 & 스택/큐 실습 코드 전체 분석

---


## 1️⃣ SinglyListEx200327.py

```python
class SList:
    class Node:
        def __init__(self, item, link):
            self.item = item      # 노드가 저장할 데이터
            self.next = link      # 다음 노드를 가리키는 포인터

    def __init__(self):
        print("나는 SList의 Constructor 메서드")  
        self.head = None         # 리스트의 시작 노드 (head)
        self.size = 0            # 리스트의 크기 (노드 개수)

    def isEmpty(self):
        return self.size == 0    # 리스트가 비었는지 확인

    def insert_front(self, item):
        if self.isEmpty():
            self.head = self.Node(item, None)   # 비어있다면 head에 새 노드 삽입
        else:
            self.head = self.Node(item, self.head)  # 기존 head 앞에 새 노드 삽입
        self.size += 1

    def insert_after(self, item, p):
        p.next = self.Node(item, p.next)   # 특정 노드 p 뒤에 새 노드 삽입
        self.size += 1

    def showList(self):
        p = self.head
        while p:
            if p.next is not None:
                print(p.item, "=> ", end="")  # 마지막 노드가 아니면 화살표 출력
            else:
                print(p.item)                 # 마지막 노드는 데이터만 출력
            p = p.next   # 다음 노드로 이동

if __name__ == "__main__":
    s = SList()                       # SList 객체 생성
    s.insert_front("mango")           # 맨 앞에 mango 삽입
    s.insert_front("apple")           # 맨 앞에 apple 삽입
    s.showList()                      # 리스트 출력
    s.insert_after("cherry", s.head.next)  # mango 뒤에 cherry 삽입
    s.showList()                      # 리스트 출력
```

### 🔹 핵심 구조
- 단일 연결 리스트 기본형
- 삽입 기능만 존재 (앞, 특정 노드 뒤)

### 🔹 동작 흐름
- apple => mango => cherry 출력

### 🔹 포인트
- 삽입만 가능, 삭제 없음
- 포인터 직접 조작 필요


---


## 2️⃣ SinglyListEx250403.py

```python
class SList:
    class Node:
        def __init__(self, item, link):
            self.item = item
            self.next = link

    def __init__(self):
        print("나는 SList의 Constructor 메서드")  
        self.head = None
        self.size = 0

    def isEmpty(self):
        return self.size == 0

    def insert_front(self, item):
        if self.isEmpty():
            self.head = self.Node(item, None)
        else:
            self.head = self.Node(item, self.head)
        self.size += 1

    def insert_after(self, item, p):
        p.next = self.Node(item, p.next)
        self.size += 1

    def find(self, target):
        p = self.head
        for k in range(self.size):
            if target == p.item:
                return k
            p = p.next

    def remove_front(self):
        if self.isEmpty():
            print("삭제작업불가")
        else:
            self.head = self.head.next
            self.size -= 1

    def remove_after(self, p):
        if self.isEmpty():
            print("리스트가 비어 삭제불가")
        else:
            temp = p.next
            p.next = temp.next
            del temp
            self.size -= 1

    def showList(self):
        p = self.head
        while p:
            if p.next is not None:
                print(p.item, "=> ", end="")
            else:
                print(p.item)
            p = p.next
```

### 🔹 핵심 구조
- 연결 리스트 확장 버전 (탐색 + 삭제 기능 추가)
- 미구현 함수는 과제용

### 🔹 동작 흐름
- 삽입 ➔ 탐색(find) ➔ 삭제(remove) ➔ 출력 반복

### 🔹 포인트
- 삭제 시 포인터 조작 필수
- 인덱스 기반 삽입/삭제 구현 예정


---


## 3️⃣ singlyListQueue250403.py

```python
class LinkedQueue:
    class Node:
        def __init__(self, item, next):
            self.item = item      # 저장할 데이터
            self.next = next      # 다음 노드를 가리키는 포인터

    def __init__(self):
        self.front = None        # 큐의 앞쪽 포인터
        self.rear = None         # 큐의 뒤쪽 포인터
        self.size = 0            # 큐의 크기

    def isEmpty(self):
        return self.size == 0

    def add(self, item):
        newnode = self.Node(item, None)  # 새 노드 생성
        if self.isEmpty():
            self.front = newnode         # 비어 있으면 front와 rear가 동일
        else:
            self.rear.next = newnode     # 기존 rear 뒤에 연결
        self.rear = newnode              # rear 갱신
        self.size += 1

if __name__ == "__main__":
    q = LinkedQueue()
    q.add("apple")
    q.add("orange")
    q.add("cherry")
```

### 🔹 핵심 구조
- 연결 리스트 기반 큐
- `add()`는 enqueue 역할만 구현됨

### 🔹 동작 흐름
- apple → orange → cherry 순으로 rear에 추가됨

### 🔹 포인트
- `popleft()` 구현 필요 (dequeue 없음)
- size와 포인터를 수동으로 관리


---


## 4️⃣ stackTest250320.py

```python
stk = [10, 20, 30]
print(f'기존값 : {stk}')
stk.append(40)
print(f"40추가후 결과 : {stk}")
topNum = stk.pop(-1)
print("topNum =", topNum)
print(f'40삭제후 결과={stk}')

def push(item):
    global top
    stack.append(item)
    top += 1

def pop():
    global top
    if len(stack) != 0:
        num = stack.pop()
        top -= 1
        return num
    else:
        print("stack이 텅 비어서 pop불가함")

stack = []  # 빈 스택 선언
top = -1

if __name__ == "__main__": 
    while True:
        num = int(input("1:삽입,2:삭제,3:종료 중 선택="))
        if num == 1:
            val = int(input("삽입할 데이터="))
            push(val)
            print("stack =", stack)
        elif num == 2:
            pop_val = pop()
            if pop_val is not None:
                print("stack의 top값 =", pop_val)
                print("stack =", stack)
        else:
            print("3:종료를 입력하였습니다.")
            break
```

### 🔹 핵심 구조
- 리스트를 이용한 스택 구현
- `top` 변수는 C언어 스타일로 관리

### 🔹 동작 흐름
- append/pop을 통해 데이터 스택처럼 관리
- 사용자 입력으로 삽입/삭제 반복

### 🔹 포인트
- 클래스 구조로 바꾸면 더 깔끔함
- 전역 변수 `top` 대신 리스트 길이 활용 가능

