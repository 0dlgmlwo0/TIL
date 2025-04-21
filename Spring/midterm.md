
# 📚 1장: 오리엔테이션 & Spring Framework 개요

---

## 🧠 자바(Java)의 역사

- **1991년**: 썬마이크로시스템즈에서 ‘그린 프로젝트’ 시작
- **1995년**: Java 1.0 공식 발표
- **2009년**: 오라클이 썬 인수 → Java 소유권 이전
- **2017년 이후**: Java EE → Jakarta EE로 이름 변경

### 🔹 주요 특징

- **WORA** (Write Once, Run Anywhere): 한번 작성하면 어디서나 실행
- **JVM**: Java Virtual Machine → 바이트코드를 OS와 무관하게 실행
- **OpenJDK 기반 무료 배포**: Amazon Corretto, Adoptium, Azul 등

---

## 🌱 Spring Framework 개요

- **정의**: 대규모 자바 웹 애플리케이션 개발을 빠르고 효율적으로 해주는 **경량 오픈소스 프레임워크**
- **장점**
  - DI 기반으로 결합도 낮음
  - 다양한 웹 모듈 제공
  - 테스트, 유지보수 용이
  - 생산성과 품질 향상

---

## ⚙️ 스프링 주요 특징

| 항목 | 설명 |
|------|------|
| POJO | 기술 종속 X, 순수 Java 객체로 개발 |
| DI (Dependency Injection) | 의존성 자동 주입, 결합도 낮춤 |
| AOP | 공통 관심사(로깅, 보안 등)를 분리하여 모듈화 |
| 트랜잭션 | 데이터의 일관성 보장, ACID 속성 지원 |

---

## 📦 스프링 주요 모듈

| 모듈 | 설명 |
|------|------|
| Core | Bean 등록/관리, DI 컨테이너 |
| Web | 웹 환경 구성 |
| Web MVC | MVC 아키텍처 기반 웹 프레임워크 |
| Boot | 내장 서버, 자동 설정 |
| Data | DB 연동 (JPA, MongoDB 등) |
| Security | 인증/인가 처리 |
| AOP | 관점 지향 프로그래밍 지원 |
| Batch | 대용량 처리용 프레임워크 |
| Cloud | 마이크로서비스 및 클라우드 연동 지원 |

---

## ✅ POJO (Plain Old Java Object)

- 프레임워크나 기술에 종속되지 않는 순수한 Java 객체
- 단순하고 독립적인 설계 가능
- 테스트 및 유지보수에 유리

### ✏️ 예시
```java
public class Book {
    private String title;
    private int price;
}
```

---

## ✅ AOP (Aspect Oriented Programming)

- 공통 관심사 분리 → 핵심 비즈니스 로직에 집중
- 로깅, 보안, 트랜잭션 등을 모듈화

### 주요 용어
- **Aspect**: 공통 기능 단위
- **Advice**: 실제 동작 코드 (before, after 등)
- **JoinPoint**: 끼워넣을 수 있는 위치 (메소드 호출 등)
- **Pointcut**: Advice 적용 지점
- **Weaving**: Advice를 실제 코드에 적용

### ✏️ 예시
```java
@Aspect
public class LoggingAspect {
    @Before("execution(* com.springmvc.service.*.*(..))")
    public void logBefore(JoinPoint joinPoint) {
        System.out.println("Before method: " + joinPoint.getSignature().getName());
    }
}
```

---

## ✅ 트랜잭션

- 데이터베이스 작업의 논리적 단위
- 전부 성공하거나 전부 실패

### 🧪 ACID 속성
- **Atomicity**: 원자성
- **Consistency**: 일관성
- **Isolation**: 고립성
- **Durability**: 지속성

### ✏️ 선언적 트랜잭션 예시
```java
@Service
@Transactional
public class BookServiceImpl implements BookService { ... }
```

---

## ✅ 마무리 요약표

| 항목 | 요약 |
|------|------|
| POJO | 기술 종속 없는 순수 자바 객체 |
| AOP | 공통 관심사를 분리하여 적용 |
| 트랜잭션 | 작업 단위를 하나로 묶어 관리, ACID 속성 |
| 주요 어노테이션 | @Controller, @Service, @Autowired, @Transactional 등 |



# 📚 2장: Spring MVC 구성 요소 및 프로젝트 구조

---

## ✅ 핵심 목표

- Spring MVC의 **기본 구조와 흐름** 이해
- DispatcherServlet 중심의 요청 처리 흐름 습득
- 프로젝트 디렉토리 구조 및 설정 파일의 역할 파악

---

## 🧱 MVC란?

> 웹 애플리케이션을 구성 요소별로 나눈 설계 패턴

| 구성 요소 | 설명 |
|-----------|------|
| Model | 데이터 처리 및 비즈니스 로직 |
| View | 사용자에게 보여지는 화면 |
| Controller | 요청을 받아서 처리하고, 결과를 View로 전달 |

---

## 🔁 Spring MVC 처리 흐름

```text
[사용자 요청]
    ↓
DispatcherServlet
    ↓
HandlerMapping → Controller
    ↓
Controller 처리 → Model 데이터 준비
    ↓
ViewResolver → JSP 경로 결정
    ↓
View → 결과 응답
```

---

## 🔧 주요 컴포넌트 설명

| 컴포넌트 | 역할 |
|----------|------|
| DispatcherServlet | 모든 요청의 시작점 (Front Controller) |
| HandlerMapping | 어떤 Controller가 요청을 처리할지 결정 |
| Controller | 사용자의 요청을 실제로 처리 |
| Model | 데이터를 담아 View로 전달 |
| ViewResolver | View 이름을 JSP 경로로 매핑 |
| View | 최종 사용자 화면을 렌더링 (보여줌) |

---

## 🗂️ 프로젝트 구조 예시

```plaintext
book-store/
├── src/
│   ├── main/
│   │   ├── java/                         ← Controller, Service, Repository
│   │   ├── resources/                   ← 설정파일, SQL 등
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   ├── spring/
│   │       │   │   ├── root-context.xml ← 공통 설정 (DB 등)
│   │       │   │   └── servlet-context.xml ← MVC 설정
│   │       │   └── views/              ← JSP 뷰 페이지들
│   │       └── resources/              ← 정적 리소스(css, js 등)
├── pom.xml                              ← Maven 설정
```

---

## ⚙️ 주요 설정 파일

### 📄 web.xml

```xml
<servlet>
  <servlet-name>appServlet</servlet-name>
  <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
  <init-param>
    <param-name>contextConfigLocation</param-name>
    <param-value>/WEB-INF/spring/servlet-context.xml</param-value>
  </init-param>
  <load-on-startup>1</load-on-startup>
</servlet>

<servlet-mapping>
  <servlet-name>appServlet</servlet-name>
  <url-pattern>/</url-pattern>
</servlet-mapping>
```

---

### 📄 servlet-context.xml

```xml
<context:component-scan base-package="com.springmvc.*"/>
<resources mapping="/resources/**" location="/resources/" />
<bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
  <property name="prefix" value="/WEB-INF/views/" />
  <property name="suffix" value=".jsp" />
</bean>
```

---

### 📄 root-context.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="http://www.springframework.org/schema/beans 
       https://www.springframework.org/schema/beans/spring-beans.xsd">
  <!-- Root Context: defines shared resources visible to all other web components -->
</beans>
```

> 공통적으로 사용하는 빈 (ex. DataSource, Service, DAO 등)을 등록하는 설정 파일

---

## 🔍 Model 관련 객체

| 객체 | 설명 |
|------|------|
| Model | 데이터를 담아 View로 전달 |
| ModelMap | Map 형태로 데이터 저장 |
| ModelAndView | 뷰 + 모델 데이터 함께 전달 |

---

## 🎯 요약 체크리스트

- DispatcherServlet은 모든 요청의 진입점이다.
- servlet-context.xml은 Controller, ViewResolver 설정을 담는다.
- root-context.xml은 공통 빈(DB 등)을 설정한다.
- web.xml은 DispatcherServlet을 등록하고 맵핑한다.
- 프로젝트 구조를 통해 역할별 디렉토리를 구분한다.



# 📚 3장: 스프링 웹 MVC의 계층적 구조

---

## ✅ 목표

- 스프링 MVC 프로젝트에서의 계층 구조 이해
- Controller, Service, Repository의 역할 구분
- 각 계층별 코드 예시 확인

---

## 🧱 계층 구조란?

> 소프트웨어를 역할별로 분리하여 유지보수가 쉽고 테스트가 편리한 구조

---

## 🔗 스프링의 3계층 구조

| 계층 | 클래스 예시 | 역할 |
|------|-------------|------|
| 🎮 Controller | BookController.java | 사용자 요청을 받아 Service 호출 |
| 🔧 Service | BookServiceImpl.java | 비즈니스 로직 처리 |
| 💾 Repository | BookRepositoryImpl.java | DB에 직접 접근, SQL 실행 |

---

## 📈 흐름도

```plaintext
[사용자 요청]
   ↓
BookController
   ↓
BookServiceImpl
   ↓
BookRepositoryImpl
   ↓
DB (JDBC, H2 등)
```

---

## 📌 각 계층별 코드 예시

### 🎮 Controller

```java
@Controller
@RequestMapping("/books")
public class BookController {

  @Autowired
  private BookService bookService;

  @GetMapping
  public String list(Model model) {
      List<Book> books = bookService.getAllBookList();
      model.addAttribute("bookList", books);
      return "books"; // → /WEB-INF/views/books.jsp
  }
}
```

---

### 🔧 Service

```java
public interface BookService {
    List<Book> getAllBookList();
}

@Service
public class BookServiceImpl implements BookService {

  @Autowired
  private BookRepository bookRepository;

  @Override
  public List<Book> getAllBookList() {
      return bookRepository.getAllBookList();
  }
}
```

---

### 💾 Repository

```java
public interface BookRepository {
    List<Book> getAllBookList();
}

@Repository
public class BookRepositoryImpl implements BookRepository {

  @Autowired
  private JdbcTemplate template;

  @Override
  public List<Book> getAllBookList() {
      String sql = "SELECT * FROM book";
      return template.query(sql, new BookRowMapper());
  }
}
```

---

## 🎯 핵심 요약

| 계층 | 책임 |
|------|------|
| Controller | 요청 처리, 사용자 입력 수신 |
| Service | 로직 수행, 중간 연산 |
| Repository | SQL 처리, DB 접근 |

---

## 🧪 보너스: 계층 구조의 장점

- 역할이 분리되어 코드가 명확함
- 단위 테스트 용이 (Mock 사용 가능)
- 유지보수와 확장이 쉬움
- 스프링 및 엔터프라이즈 개발에서 표준 구조



# 📚 4장: 데이터베이스 연동 & 로깅

---

## ✅ 목표

- 스프링에서 DB를 연동하는 구조 이해
- JdbcTemplate 활용법 습득
- 로깅의 필요성과 사용법 학습

---

## 1️⃣ JDBC와 JdbcTemplate

### 📌 JDBC
자바에서 DB와 통신하는 표준 API. 하지만 코드가 길고 복잡함.

### 📌 JdbcTemplate
Spring이 제공하는 DB 유틸 클래스.  
SQL 실행, 자원 해제 등을 간단하게 처리할 수 있음.

```java
String sql = "SELECT * FROM book";
List<Book> list = jdbcTemplate.query(sql, new BookRowMapper());
```

---

## 2️⃣ DB 연동 구조

```plaintext
root-context.xml
   ↓
DataSource → JdbcTemplate Bean 생성
   ↓
Repository에서 JdbcTemplate 사용
   ↓
SQL 실행 → DB 연결
```

---

## 3️⃣ root-context.xml 설정 예

```xml
<context:property-placeholder location="classpath:db.properties"/>
<bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
  <property name="driverClassName" value="${datasource.driverClassName}" />
  <property name="url" value="${datasource.url}" />
  <property name="username" value="${datasource.username}" />
  <property name="password" value="${datasource.password}" />
</bean>

<bean id="jdbcTemplate" class="org.springframework.jdbc.core.JdbcTemplate">
  <property name="dataSource" ref="dataSource" />
</bean>
```

---

## 4️⃣ Repository 사용 예

```java
@Repository
public class BookRepositoryImpl implements BookRepository {

  @Autowired
  private JdbcTemplate template;

  @Override
  public List<Book> getAllBookList() {
      String sql = "SELECT * FROM book";
      return template.query(sql, new BookRowMapper());
  }
}
```

---

## 5️⃣ RowMapper 예시

```java
public class BookRowMapper implements RowMapper<Book> {
  @Override
  public Book mapRow(ResultSet rs, int rowNum) throws SQLException {
    Book book = new Book();
    book.setBookId(rs.getString("b_bookId"));
    ...
    return book;
  }
}
```

---

## 6️⃣ 로깅 (Logging)

### 📌 정의
프로그램 실행 중의 상태를 기록하여 디버깅, 오류 추적, 감시에 활용.

---

## 7️⃣ 로깅 라이브러리

| 라이브러리 | 설명 |
|------------|------|
| SLF4J | 통합 로그 인터페이스 |
| Logback | SLF4J의 대표 구현체 |
| Log4j2 | 대안 라이브러리 (보안 주의) |

---

## 8️⃣ Logger 사용 예

```java
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
public class BookController {
  private final Logger log = LoggerFactory.getLogger(BookController.class);

  @GetMapping("/books")
  public String getBooks(Model model) {
    log.info("도서 목록 요청 들어옴");
    return "books";
  }
}
```

---

## 9️⃣ 로그 레벨

| 레벨 | 설명 |
|------|------|
| TRACE | 가장 상세한 로그 |
| DEBUG | 디버깅용 정보 |
| INFO | 일반적인 실행 정보 |
| WARN | 잠재적 문제 경고 |
| ERROR | 실제 오류 발생 |

---

## 🔟 logback.xml 설정 예

```xml
<configuration>
  <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
    <encoder>
      <pattern>%d{HH:mm:ss.SSS} [%thread] %-5level %logger - %msg%n</pattern>
    </encoder>
  </appender>

  <root level="INFO">
    <appender-ref ref="STDOUT" />
  </root>
</configuration>
```

---

## 🧠 요약

| 항목 | 설명 |
|------|------|
| JdbcTemplate | DB 쿼리 실행 도우미 |
| DataSource | DB 연결 정보 저장 |
| RowMapper | 결과 → 객체로 변환 |
| Logger | 로그 메시지를 기록하는 객체 |
| SLF4J + Logback | 가장 많이 쓰이는 로그 조합 |



# 📚 5장: 스프링 웹 MVC의 컨트롤러


## 1️⃣ @Controller란?

> 이 클래스가 **웹 요청을 처리하는 컨트롤러** 역할을 한다고 스프링에게 알려주는 어노테이션

```java
@Controller
public class BookController {
    ...
}
```

---

## 2️⃣ 요청 URL과 메소드 연결하기

### ✅ @RequestMapping

```java
@RequestMapping(value="/books", method=RequestMethod.GET)
public String listBooks() {
    return "books";
}
```

- URL: `/books`
- HTTP 방식: GET

---

### ✅ @GetMapping / @PostMapping

```java
@GetMapping("/books")
public String getBooks() {
    return "books";
}

@PostMapping("/books")
public String addBook() {
    return "result";
}
```

- `@GetMapping` → 조회
- `@PostMapping` → 등록/제출

---

## 3️⃣ 컨트롤러의 리턴값은 뷰 이름

```java
return "home";
```

→ `/WEB-INF/views/home.jsp`로 이동됨 (ViewResolver 설정 덕분)

---

## 4️⃣ Model 객체로 데이터 넘기기

```java
@GetMapping("/books")
public String listBooks(Model model) {
    List<Book> list = bookService.getAllBookList();
    model.addAttribute("bookList", list);
    return "books";
}
```

→ JSP에서는 `${bookList}`로 꺼내서 사용 가능

---

## 5️⃣ Model, ModelMap, ModelAndView 비교

| 객체 | 특징 |
|------|------|
| **Model** | 가장 많이 쓰이고 심플함. `addAttribute()` 사용. 내부적으로는 Map처럼 작동함 |
| **ModelMap** | 실제 `Map<String, Object>`를 상속받은 클래스. `put()`, `putAll()` 등 사용 가능 |
| **ModelAndView** | View 이름과 Model 데이터를 한 객체에 담는 방식. 무거운 대신 강력함 |

### 💡 ModelMap은 왜 "put()"이 되냐?

ModelMap은 실제로 `LinkedHashMap`을 상속받은 클래스이기 때문에  
**Map처럼 key-value를 자유롭게 추가**할 수 있다!

```java
modelMap.put("name", "지우");
modelMap.addAttribute("age", 25);
modelMap.putAll(Map.of("city", "서울", "job", "학생"));
```

→ 즉, **Model보다 메소드가 더 다양**해서 유연하게 쓸 수 있다는 뜻!

---

## 6️⃣ 전체 흐름 요약

```plaintext
브라우저 → URL 요청 → DispatcherServlet
      ↓
BookController의 메소드 실행
      ↓
Model에 데이터 담기
      ↓
View 이름 반환 → ViewResolver → JSP 실행
      ↓
JSP에서 ${데이터} 출력
```

---

## 🎯 정리 요약

| 개념 | 설명 |
|------|------|
| @Controller | 요청을 처리하는 클래스임을 명시 |
| @RequestMapping / @GetMapping / @PostMapping | 어떤 URL 요청을 어떤 메소드가 처리할지 지정 |
| return "뷰이름" | View 이름을 반환 (JSP 이름) |
| Model | 데이터를 JSP로 넘길 수 있는 객체 |
| ModelMap | Map처럼 작동하는 Model, put() 등 사용 가능 |
| ModelAndView | 데이터 + 뷰 이름을 동시에 담는 객체 |




# 📚 6장: 요청 처리 메소드의 파라미터 유형



## 🔗 요청 파라미터를 받는 4가지 방식

| 어노테이션 | 설명 | 사용 예시 |
|------------|------|------------|
| `@RequestParam` | 쿼리스트링 값 받기 | `/books?category=IT` |
| `@PathVariable` | URL 경로 일부 받기 | `/books/IT` |
| `@MatrixVariable` | URL 세미콜론 값 받기 | `/books/filter;category=IT;publisher=길벗` |
| `@ModelAttribute` | 폼 입력값을 객체로 받기 | 회원가입 폼 등 |

---

## 🧩 각각의 예시

### ✅ `@RequestParam`

```java
@GetMapping("/books")
public String books(@RequestParam("category") String category) {
    ...
}
```

📎 `/books?category=IT`

---

### ✅ `@PathVariable`

```java
@GetMapping("/books/{category}")
public String booksByCategory(@PathVariable String category) {
    ...
}
```

📎 `/books/IT`

---

### ✅ `@MatrixVariable`

```java
@GetMapping("/books/filter/{filter}")
public String filterBooks(@MatrixVariable(pathVar = "filter") Map<String, List<String>> filters) {
    ...
}
```

📎 `/books/filter;category=IT;publisher=길벗`

> 사용 전 servlet-context.xml에 설정 필요:
```xml
<annotation-driven enable-matrix-variables="true" />
```

---

### ✅ `@ModelAttribute`

```java
@PostMapping("/member")
public String join(@ModelAttribute Member member) {
    ...
}
```

→ 폼 데이터가 객체에 자동으로 들어감

---

## ❗️시험 핵심: MatrixVariable 필터링이 안 되는 이유 (6장 31~32쪽)

### 😱 문제
Set<Book>에서 `retainAll()`이 작동하지 않음  
→ 필터링 결과가 출력되지 않음

### 🔍 원인
Book 클래스에 `equals()`와 `hashCode()`가 정의되어 있지 않음

### ✅ 해결 방법
Book 클래스에 다음 메소드 추가:

```java
@Override
public int hashCode() {
    return Objects.hash(bookId);
}

@Override
public boolean equals(Object obj) {
    if (this == obj) return true;
    if (obj == null || getClass() != obj.getClass()) return false;
    Book other = (Book) obj;
    return Objects.equals(bookId, other.bookId);
}
```

> 📌 Eclipse에서 자동 생성 가능:  
`Book.java → 우클릭 → Source → Generate hashCode() and equals()`

---

## 🎯 마무리 요약

| 어노테이션 | 언제 사용? | 예시 |
|------------|------------|------|
| `@RequestParam` | 쿼리 파라미터 | `/books?category=IT` |
| `@PathVariable` | 경로 일부 | `/books/IT` |
| `@MatrixVariable` | 조건 여러 개를 URL에 | `/filter;publisher=길벗;category=IT` |
| `@ModelAttribute` | 폼 전체 → 객체 | 게시글 등록 |

| 시험 포인트 | 이유 |
|--------------|------|
| MatrixVariable 필터 실패 | Book 객체 비교가 안 됨 |
| 원인 | equals(), hashCode()가 없음 |
| 해결 | Book 클래스에 메소드 추가 |



# 📚 7장: 스프링 폼 태그 라이브러리 (시험범위: `<form:form>`까지)

---

## ✅ 스프링 폼 태그란?

> HTML의 `<form>` 태그를 대신해서 사용하는 스프링 전용 태그들  
JSP에서 데이터를 **자바 객체와 자동으로 바인딩**해주는 기능이 핵심이야.

---

## 🎯 왜 `<form:form>`을 써야 할까?

| 일반 HTML `<form>` | `<form:form>` |
|-------------------|------------------|
| 데이터 수동 처리 필요 | 자동으로 객체와 연결됨 |
| 입력값 유지 안됨 | 자동으로 값 유지 |
| 검증 결과 표시 어려움 | 에러 메시지 출력 쉬움 |

---

### 📌 1. 컨트롤러에서 빈 객체를 전달

```java
@GetMapping("/add")
public String form(Model model) {
    model.addAttribute("book", new Book());
    return "addBook";
}
```

여기서 `book`은 `Book`이라는 클래스의 인스턴스고, JSP에서 사용할 수 있게 모델에 담겨.

---

### 📌 2. JSP 파일에서 `<form:form>` 사용

```jsp
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form modelAttribute="book" action="/add" method="post">
    <p>도서명: <form:input path="name" /></p>
    <p>가격: <form:input path="price" /></p>
    <button type="submit">등록</button>
</form:form>
```

- `modelAttribute="book"` → 컨트롤러에서 받은 `book` 객체와 연결
- `path="name"` → `book.getName()`과 자동 연결됨

---

### 📌 3. 내부 동작 방식

```jsp
<form:input path="name"/>
```

이 코드는 렌더링 되면 이렇게 변신해:
```html
<input type="text" name="name" value="${book.name}">
```

**스프링이 알아서 값을 꺼내 넣어줘!**

---

### 📌 4. 입력값 전송 → 객체 자동 바인딩

```java
@PostMapping("/add")
public String add(@ModelAttribute("book") Book book) {
    // 사용자가 입력한 name, price가 자동으로 book 객체에 바인딩됨
    return "result";
}
```

---

## ✅ 6쪽 주요 속성 설명

| 속성명 | 설명 |
|--------|------|
| `modelAttribute` | 바인딩할 객체의 이름. 컨트롤러에서 `model.addAttribute("book", new Book())`로 등록한 이름과 같아야 함 |
| `path` | 객체 내부의 필드명. `<form:input path="name" />`은 `book.getName()`과 연결됨 |
| `action` | 폼 제출 시 데이터를 보낼 URL 경로 |
| `method` | HTTP 요청 방식 (예: post, get 등) |

---

## ✅ 핵심 태그 설명 요약

| 태그 | 설명 |
|------|------|
| `<form:form>` | HTML `<form>`을 대체. 자바 객체와 자동 연결 |
| `modelAttribute="book"` | 연결할 자바 객체 이름 |
| `<form:input path="name"/>` | `book.name` 필드와 연결 |
| 태그라이브러리 선언 | `<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>` |

---
