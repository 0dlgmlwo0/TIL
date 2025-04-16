
# 🏥 Spring 병원 프로젝트 흐름 완전 정복 (지우 특강)

---

## ✅ 전체 동작 흐름 요약

```
[1] 사용자 요청 (/map 또는 /mapData)
   ↓
[2] MapController가 요청 받음
   ↓
[3] HospitalServiceImpl로 전달
   ↓
[4] HospitalDAOImpl에서 DB에 SQL 날림
   ↓
[5] 병원 리스트 응답 → Controller → View or JSON
   ↓
[6] map.jsp: 병원 마커 표시
```

---

## 📦 클래스 vs 객체

| 개념 | 설명 | 예시 |
|------|------|------|
| 클래스 | 객체를 만들기 위한 설계도 | `HospitalService`, `MapController` |
| 객체 | 클래스를 바탕으로 만들어진 실체 | `new HospitalService()` |

---

## 🧃 의존성 주입 (DI) 정리

```java
@Autowired
public MapController(HospitalService hospitalService) {
    this.hospitalService = hospitalService;
}
```

| 요소 | 설명 |
|------|------|
| `@Autowired` | 필요한 객체를 스프링이 자동으로 넣어줌 |
| `this.hospitalService = hospitalService` | 외부에서 받은 객체를 내 클래스에 저장 |
| `HospitalService` | 병원 기능을 수행하는 서비스 클래스 |

---

## 🧠 @ 어노테이션 한눈에 정리

| 어노테이션 | 설명 |
|------------|------|
| `@Controller` | 요청을 처리하는 클래스임을 나타냄 |
| `@Service` | 비즈니스 로직을 담당하는 클래스 |
| `@Repository` | DB와 연결된 클래스 |
| `@Autowired` | 객체를 자동으로 연결 |
| `@GetMapping("/url")` | 특정 URL로 GET 요청 받을 때 사용 |
| `@ResponseBody` | 데이터를 JSON 형식으로 응답 |

---

## 🧱 구조별 클래스 설명

### 📌 Controller (MapController.java)

```java
@GetMapping("/map")
public String showMapPage() {
    return "map";
}
```

- 화면을 띄워주는 역할 (JSP)
- 또는 `/mapData` 요청 시 JSON 응답

---

### 📌 Service (HospitalServiceImpl.java)

```java
@Override
public List<HospitalDTO> getHospitals() {
    return hospitalDAO.getAllHospitals();
}
```

- 비즈니스 로직 담당
- DAO에게 데이터 요청 후 Controller에 전달

---

### 📌 DAO (HospitalDAOImpl.java)

```java
String sql = "SELECT ... FROM hospital_main";

return jdbcTemplate.query(sql, (rs, rowNum) -> {
    return new HospitalDTO(...);
});
```

- 실제 SQL을 실행하고
- 결과를 DTO로 만들어 리스트로 반환

---

### 📌 View (map.jsp)

```javascript
fetch('/mapData')
  .then(response => response.json())
  .then(hospitals => {
    hospitals.forEach(hospital => {
        // 마커 찍기
    });
});
```

- 자바스크립트로 병원 데이터 받아와서
- 지도에 마커 표시 (카카오맵 SDK 사용)

---

## 🔁 흐름 그림 요약

```
[사용자 요청]
   ↓
[Controller] - MapController
   ↓
[Service] - HospitalServiceImpl
   ↓
[DAO] - HospitalDAOImpl
   ↓
[DB] 병원 데이터 조회
   ↓
[View] - map.jsp 또는 JSON
```

---

## 📌 사용된 주요 기술 & 도구

| 기술 | 역할 |
|------|------|
| Spring MVC | 전체 웹 애플리케이션 프레임워크 |
| JSTL | JSP에서 반복문, 조건문 등 |
| JdbcTemplate | SQL 실행을 쉽게 도와주는 도구 |
| 카카오맵 API | 병원 위치 지도 표시 |
| JSON | 데이터 응답 형식 (AJAX 등) |

---

