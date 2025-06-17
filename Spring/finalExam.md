
# 🌱 스프링 프레임워크 시험 대비 정리

---

## ✅ 1. 리다이렉트 vs 포워드

| 구분        | 포워드 (`forward:`) | 리다이렉트 (`redirect:`) |
|-------------|----------------------|---------------------------|
| 작동 방식   | 서버 내부에서 이동     | 클라이언트에게 새 요청 발생 |
| URL 변경    | X                   | O                         |
| 요청/응답 공유 | O (기존 request 유지) | X (새 요청으로 처리됨)    |
| 사용 목적   | 내부 자원 이동         | 새 페이지로 재요청 유도     |

---

## ✅ 2. `@InitBinder`

- 컨트롤러 내에서 폼 데이터 바인딩 전에 설정 작업을 수행할 수 있도록 해줌.
- 주로 날짜, 숫자 등의 변환 처리에 사용.

```java
@InitBinder
public void initBinder(WebDataBinder binder) {
    binder.registerCustomEditor(Date.class, new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), false));
}
```

---

## ✅ 3. 스프링 시큐리티 설정 및 태그

### 설정 예시
```xml
<http auto-config="true">
  <intercept-url pattern="/admin/**" access="hasRole('ADMIN')" />
  <form-login login-page="/login" default-target-url="/" />
  <logout logout-url="/logout" logout-success-url="/" />
</http>
```

### 태그 예시 (JSP)
```jsp
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authorize access="hasRole('ROLE_ADMIN')">
  관리자 메뉴
</sec:authorize>
```

---

## ✅ 4. 폼 로그인 및 로그아웃

- 로그인 설정: `<form-login login-page="/login" default-target-url="/" />`
- 로그아웃 설정: `<logout logout-url="/logout" logout-success-url="/" />`

---

## ✅ 5. 파일 업로드 브라우저 처리 방식

- `multipart/form-data` 방식으로 업로드
- HTML 폼에서 `enctype="multipart/form-data"` 지정 필요
- Spring에서는 `CommonsMultipartResolver` 또는 `StandardServletMultipartResolver` 사용

---

## ✅ 6. 자바 서블릿 & web.xml 속성

```xml
<context-param>
  <param-name>contextConfigLocation</param-name>
  <param-value>/WEB-INF/spring/root-context.xml</param-value>
</context-param>
```

---

## ✅ 7. 파일 업로드 경로 (외부 경로 사용하는 이유)

- WAR 배포 시 내부 경로는 덮어씌워짐 → 파일 유지 불가
- 보안 및 유지보수를 위해 외부 경로 (`/var/upload/`, `C:/upload/`) 사용

---

## ✅ 8. 예외 처리 우선순위

| 처리 방식 | 어노테이션     | 대상           | 우선순위 |
|-----------|----------------|----------------|----------|
| 컨트롤러 내 | `@ExceptionHandler` | 메서드 (예외별 처리) | 높음     |
| 전체 전역  | `@ControllerAdvice` | 공통 예외 처리      | 중간     |
| 상태 코드 반환 | `@ResponseStatus`  | 예외 클래스         | 낮음     |

---

## ✅ 9. 익셉션 핸들러

```java
@ExceptionHandler(IOException.class)
public String handleIOException(IOException e) {
    return "error/ioerror";
}
```

---

## ✅ 10. `@ControllerAdvice`

- 여러 컨트롤러의 예외를 공통 처리
- 속성:
  - `annotations`: 특정 어노테이션 대상
  - `assignableTypes`: 특정 클래스 대상
  - `basePackages`: 특정 패키지 대상
  - `basePackageClasses`: 클래스 기반 패키지 대상

---

## ✅ 11. Log4j

- 구조: **Logger → Appender → Layout**
- 설정 예 (log4j.properties):
```properties
log4j.rootLogger=INFO, stdout
log4j.appender.stdout=org.apache.log4j.ConsoleAppender
log4j.appender.stdout.layout=org.apache.log4j.PatternLayout
```

---

## ✅ 12. 인터셉터 (`HandlerInterceptor`)

- 요청 전/후/완료 시점에 로직 삽입 가능
```java
public class MyInterceptor implements HandlerInterceptor {
    public boolean preHandle(...) { ... }
    public void postHandle(...) { ... }
    public void afterCompletion(...) { ... }
}
```

---

## ✅ 13. 비동기 처리

- `@Async` 사용
```java
@Async
public void sendEmail(...) { ... }
```
- `@EnableAsync` 필요

---

## ✅ 14. `ThreadLocal`

- 현재 쓰레드에만 값을 저장
```java
ThreadLocal<String> threadLocal = new ThreadLocal<>();
threadLocal.set("UserID");
```

---

## ✅ 15. 메시지 리소스 및 출력

### messages.properties
```properties
greeting=안녕하세요, {0}님!
```

### 뷰에서 출력
```jsp
<spring:message code="greeting" arguments="지우" />
```

---

## ✅ 16. 로케일 리졸버

```xml
<bean id="localeResolver"
      class="org.springframework.web.servlet.i18n.SessionLocaleResolver" />
```
- 사용자 언어 설정에 따라 메시지를 다국어로 자동 출력

---
