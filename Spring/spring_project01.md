## 📌 전체 동작 순서 (요청 → 응답)

```
[1] 사용자가 브라우저에서 주소 입력 또는 클릭 (/map, /mapData)
  ↓
[2] 스프링의 DispatcherServlet이 요청 받음.
  ↓
[3] 요청 URL에 맞는 Controller의 메서드 실행.
  ↓
[4] Controller → Service 호출.
  ↓
[5] Service → DAO 호출 (데이터 꺼내기)
  ↓
[6] DAO → MyBatis Mapper → SQL 실행 → DB에서 데이터 조회.
  ↓
[7] 결과를 Controller로 다시 전달.
  ↓
[8] View(JSP)에 데이터를 넘기거나 JSON 응답.
```

---

## 📁 1단계: `web.xml` - 스프링 웹 프로젝트의 진입점

### 핵심 역할
- 웹 프로젝트 실행 시, **처음 실행되는 설정 파일**
- DispatcherServlet과 인코딩 필터, Spring 초기화 설정 등을 포함

### 주요 태그 설명

| 태그 | 역할 |
|------|------|
| `<listener>` | Spring 설정 파일 초기화 (root-context.xml) |
| `<servlet>` | DispatcherServlet 등록 (웹 요청의 핵심 엔진) |
| `<servlet-mapping>` | DispatcherServlet이 모든 요청(`/*`) 받도록 설정 |
| `<filter>` | 한글 인코딩 설정 (UTF-8) |

---

## 📁 2단계: `servlet-context.xml` - DispatcherServlet의 지휘서

### 핵심 역할
- DispatcherServlet이 **어떤 클래스들을 Controller로 쓸지**
- 어떤 폴더에서 JSP를 찾을지, 어노테이션 기반 기능을 쓸 수 있게 해줌

### 주요 태그 설명

| 태그 | 역할 |
|------|------|
| `<context:component-scan>` | `@Controller`, `@Service` 자동 등록 범위 지정 |
| `<mvc:annotation-driven>` | `@GetMapping`, `@ResponseBody` 등 어노테이션 기능 활성화 |
| `<bean class="...ViewResolver">` | JSP 파일 경로 설정 (prefix, suffix 지정) |

---

## 📘 용어 정리

| 용어 | 설명 |
|------|------|
| DispatcherServlet | 스프링 웹의 요청 처리 엔진 |
| Component Scan | 특정 패키지 내의 클래스를 자동 등록 |
| ViewResolver | 반환된 문자열을 JSP 경로로 바꿔주는 도구 |
| Annotation-driven | 어노테이션 기반 기능들을 가능하게 해주는 설정 |

---


