## 📦 클래스 vs 객체 

| 개념 | 설명 | 비유 |
|------|------|------|
| 클래스 | 객체를 만들기 위한 설계도 | 붕어빵 틀, 레시피 |
| 객체 | 클래스(설계도)로 실제로 만들어진 것 | 붕어빵, 실제 요리 |

```java
public class Dog {
    void bark() { System.out.println("멍멍"); }
}
Dog myDog = new Dog(); // 객체 생성.
myDog.bark(); // 멍멍 출력.
```

---

## 🧃 의존성 주입(DI) 완전 쉽게 정리

```java
@Autowired
public MapController(HospitalService hospitalService) {
    this.hospitalService = hospitalService;
}
```

| 요소 | 설명 |
|------|------|
| `@Autowired` | 필요한 객체를 스프링이 자동으로 넣어줌. |
| `HospitalService hospitalService` | 외부에서 받아온 객체 (매개변수.) |
| `this.hospitalService` | 클래스 안에 저장해둘 내 변수. |
| `=` | 받은 걸 내 변수에 저장. |



---

## 🔄 왜 변수 이름을 같게 써?

```java
this.hospitalService = hospitalService;
```

| 구분 | 설명 |
|------|------|
| `this.hospitalService` | 클래스 안의 필드 변수. |
| `hospitalService` | 생성자에 들어온 매개변수. |
| 이름을 같게 쓰는 이유 | 의미가 명확하고 자연스럽기 때문. |
| 안 헷갈리게 하는 방법 | `this.` 키워드로 구분 가능. |

> 예: `this.apple = apple;` → 클래스 내부에 저장하기 위한 명확한 표현.

---

## 🔧 MapController 전체 구조 요약

```java
@Controller
public class MapController {
    private final HospitalService hospitalService;

    @Autowired
    public MapController(HospitalService hospitalService) {
        this.hospitalService = hospitalService;
    }

    @GetMapping("/map")
    public String showMapPage() {
        return "map";
    }

    @ResponseBody
    @GetMapping("/mapData")
    public List<HospitalDTO> getHospitals() {
        return hospitalService.getHospitals();
    }
}
```

---

## 📘 지금까지 나온 주요 어노테이션 정리

| 어노테이션 | 설명 |
|------------|------|
| `@Controller` | 이 클래스는 요청을 처리하는 역할 |
| `@Autowired` | 객체를 자동으로 넣어주는 기능 |
| `@GetMapping("/url")` | GET 방식 요청이 들어왔을 때 실행할 메서드 지정 |
| `@ResponseBody` | JSON 형태로 응답을 내보냄 (화면 없이 데이터만 보낼 때 사용) |

---

