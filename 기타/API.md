
# 📡 API란 무엇인가?

## ✅ 개념 정리

**API (Application Programming Interface)**는  
> "서로 다른 소프트웨어 시스템 간의 데이터 통신을 위한 규칙 또는 인터페이스"입니다.

쉽게 말해, API는 소프트웨어 간 대화를 가능하게 해주는 **중간 통역자**입니다.

---

## 🧭 실생활 예시로 이해하기

> 배달 앱에서 음식 주문 시:

- **클라이언트(앱)**: "이 음식 주문할게!"
- **서버(음식점 시스템)**: "주문 확인했어, 곧 배달할게!"

이처럼 앱이 서버에 요청을 보내고, 서버가 응답을 주는 것이 바로 **API 통신**입니다.

---

## 🚀 REST API란?

**REST (Representational State Transfer)**는 웹에서 가장 널리 사용되는 API 설계 방식입니다.

### HTTP 메서드별 역할

| 메서드 | 설명 | 예시 |
|--------|------|------|
| `GET` | 데이터 조회 | `/api/users` |
| `POST` | 데이터 생성 | `/api/users` |
| `PUT` | 데이터 수정 | `/api/users/1` |
| `DELETE` | 데이터 삭제 | `/api/users/1` |

REST API는 **URL과 HTTP 메서드**를 조합하여 **자원(Resource)**에 대한 행동을 정의합니다.

---

# 🛠️ Spring Framework에서 API 구현하기

## 📁 기본 구조

```
📦 src/main/java/com/example/demo
 ┣ 📂controller      → API 요청 처리
 ┣ 📂service         → 비즈니스 로직
 ┣ 📂repository      → DB 연동
 ┗ 📂model           → 데이터 구조 정의 (Entity)
```

---

## 1️⃣ 모델 (Entity)

```java
@Entity
public class User {
    @Id @GeneratedValue
    private Long id;

    private String name;
    private String email;

    // Getters & Setters
}
```

---

## 2️⃣ 리포지토리 (Repository)

```java
public interface UserRepository extends JpaRepository<User, Long> {
}
```

---

## 3️⃣ 서비스 (Service)

```java
@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User addUser(User user) {
        return userRepository.save(user);
    }
}
```

---

## 4️⃣ 컨트롤러 (Controller)

```java
@RestController
@RequestMapping("/api/users")
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public List<User> getUsers() {
        return userService.getAllUsers();
    }

    @PostMapping
    public User createUser(@RequestBody User user) {
        return userService.addUser(user);
    }
}
```

---

## 🔍 테스트 방법

### 🧪 Postman (추천)
- `GET http://localhost:8080/api/users` → 유저 목록 조회
- `POST http://localhost:8080/api/users` + Body(JSON):  
```json
{
  "name": "이희재",
  "email": "hj@example.com"
}
```

### 🌐 웹 브라우저
- `GET http://localhost:8080/api/users` 직접 입력

---

## ✅ 요약

| 구성 요소 | 역할 |
|-----------|------|
| Model (Entity) | DB에 저장되는 데이터 구조 정의 |
| Repository | DB와 직접 통신 |
| Service | 비즈니스 로직 담당 |
| Controller | API 요청을 받고 응답 반환 |

---

## 💬 참고 용어 정리

| 용어 | 설명 |
|------|------|
| JSON | 데이터 전달에 사용하는 포맷. `{ "key": "value" }` 형태 |
| REST | 자원을 URL로 표현하고, HTTP 메서드로 동작을 구분하는 방식 |
| DTO | (Data Transfer Object) → 클라이언트와 서버 간 전송용 객체 |
| CRUD | Create, Read, Update, Delete — 기본적인 데이터 조작 기능 |

---

> 이 문서는 Spring 기반 REST API를 처음 접하는 팀원에게도 이해하기 쉽고, 깃허브 리드미에 넣어도 손색없도록 구성되어 있습니다.
