# 🌱 Spring MVC 구조 및 동작 원리 정리

## 📌 Spring MVC란?

Spring MVC(Model-View-Controller)는 Java 기반의 웹 애플리케이션 프레임워크인 **Spring Framework**의 웹 모듈입니다. **HTTP 요청을 처리하고**, **비즈니스 로직을 실행**하며, **결과를 View로 반환**하는 구조를 제공합니다.

---

## 🧩 MVC 아키텍처의 기본 개념

### 1. Model
- 데이터와 비즈니스 로직을 담당
- 서비스 클래스나 DAO, DTO, Entity 등이 포함됨
- DB에서 가져온 데이터를 캡슐화하여 Controller와 View로 전달

### 2. View
- 사용자에게 보여지는 화면(UI)
- JSP, Thymeleaf, HTML, JSON 등으로 표현
- Controller로부터 전달된 데이터를 이용해 출력

### 3. Controller
- 클라이언트 요청을 받아 처리하고 적절한 Model과 View를 연결
- `@Controller`, `@RequestMapping` 등 어노테이션으로 구현
- 요청 → 서비스 호출 → 결과를 View에 전달

---

## 🛠️ Spring MVC 처리 흐름 (DispatcherServlet 중심)

```plaintext
1. 클라이언트가 URL을 통해 요청(Request)을 보냄
        ↓
2. DispatcherServlet이 요청을 받음
        ↓
3. HandlerMapping이 요청 URL에 맞는 Controller를 찾음
        ↓
4. Controller가 비즈니스 로직(Service, DAO)을 처리
        ↓
5. 처리 결과를 Model 객체로 구성
        ↓
6. ViewResolver가 결과를 보여줄 View를 결정
        ↓
7. View에게 데이터를 전달하여 렌더링
        ↓
8. 클라이언트에게 응답(Response) 전달
```

---

## 🧱 주요 구성 요소 설명

### 1. DispatcherServlet
- **Front Controller** 역할
- 모든 요청을 받아 Controller로 전달
- web.xml이나 Spring Boot에서는 자동 등록

```xml
<!-- web.xml 예시 -->
<servlet>
    <servlet-name>dispatcher</servlet-name>
    <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
</servlet>

<servlet-mapping>
    <servlet-name>dispatcher</servlet-name>
    <url-pattern>/</url-pattern>
</servlet-mapping>
```

---

### 2. HandlerMapping
- 요청 URL을 분석해 어떤 Controller가 처리할지 매핑
- 내부적으로는 `@RequestMapping` 정보 활용

---

### 3. Controller
- 실제 요청을 처리하는 클래스
- `@Controller`, `@RestController`, `@RequestMapping` 사용
- 예시:

```java
@Controller
public class HomeController {

    @RequestMapping("/hello")
    public String hello(Model model) {
        model.addAttribute("message", "Hello Spring MVC!");
        return "hello"; // View 이름
    }
}
```

---

### 4. Model
- 데이터를 담는 객체
- View에 데이터를 전달할 때 사용
- 예: `Model`, `ModelAndView`, `@ModelAttribute`

---

### 5. ViewResolver
- Controller가 리턴한 View 이름을 실제 JSP 경로로 매핑
- 예: "hello" → "/WEB-INF/views/hello.jsp"

```xml
<!-- dispatcher-servlet.xml -->
<bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/WEB-INF/views/" />
    <property name="suffix" value=".jsp" />
</bean>
```

---

### 6. View
- 최종적으로 사용자에게 보여지는 화면
- JSP, Thymeleaf, JSON 등 다양한 형태

---

## ✨ 어노테이션 정리

| 어노테이션 | 설명 |
|------------|------|
| `@Controller` | 클래스를 Controller로 지정 |
| `@RestController` | JSON/XML 반환하는 REST API Controller |
| `@RequestMapping` | 요청 URL과 매핑 |
| `@GetMapping`, `@PostMapping` | HTTP 메서드 별 매핑 |
| `@ModelAttribute` | 폼 데이터 바인딩 |
| `@RequestParam` | 단일 요청 파라미터 받기 |
| `@PathVariable` | URL 경로의 변수 받기 |
| `@ResponseBody` | 반환 값을 응답 본문으로 전송 |

---

## 🧪 간단한 예제 흐름

- **요청**: GET `/hello`
- **DispatcherServlet** → `/hello` 매핑된 Controller 호출
- **Controller**: `model.addAttribute("message", "Hello!")`
- **ViewResolver**: `"hello"` → `/WEB-INF/views/hello.jsp`
- **View**: JSP가 HTML 렌더링하여 클라이언트에 응답

---

## 📚 참고 자료

- Spring 공식 문서: https://spring.io/projects/spring-framework
- Baeldung Spring MVC: https://www.baeldung.com/spring-mvc-tutorial

---
