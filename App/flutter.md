
# 📦 Flutter 기본 개념 및 개발 준비

---

## 1. Flutter란?

- 구글이 개발한 **크로스 플랫폼** 프레임워크  
- 하나의 코드로 Android, iOS, 웹, 데스크탑 앱까지 개발 가능  
- **Dart 언어** 사용  
- **Hot Reload** 기능으로 빠른 테스트 가능  

---

## 2. 개발 환경 준비

### ✅ 설치 목록
- Flutter SDK  
- Android Studio 또는 Visual Studio Code  
- Android Emulator 또는 실제 디바이스  
- Android SDK, Java JDK  
- `flutter doctor` 명령어로 환경 확인

```bash
flutter doctor
```

---

## 3. 프로젝트 생성 및 구조

```bash
flutter create my_app
cd my_app
code .
```

### 📁 주요 디렉토리 설명

| 디렉토리/파일 | 설명 |
|---------------|------|
| `lib/` | 실제 Dart 코드 작성 공간 |
| `main.dart` | 앱의 진입점 |
| `pubspec.yaml` | 의존성 및 리소스 설정 파일 |
| `android/`, `ios/` | 플랫폼 별 코드 및 설정 |
| `test/` | 단위 테스트 코드 작성 공간 |

---

# 🧠 Dart 기본 문법 요약

---

## 1. 변수 선언

```dart
var name = 'Jiwu'; // 타입 추론
String title = 'Flutter';
int age = 25;
```

## 2. 함수

```dart
int add(int a, int b) {
  return a + b;
}
```

## 3. 조건문

```dart
if (age > 18) {
  print('Adult');
} else {
  print('Teen');
}
```

## 4. 반복문

```dart
for (int i = 0; i < 5; i++) {
  print(i);
}
```

## 5. 클래스

```dart
class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void greet() {
    print('Hello, $name');
  }
}
```

---

## 6. 주요 키워드 정리

| 키워드 | 설명 |
|--------|------|
| `var` | 타입 추론 |
| `final` | 수정 불가능 변수 |
| `const` | 컴파일 타임 상수 |
| `this` | 현재 객체 참조 |
| `void` | 반환값 없음 |

---

## 7. 비동기 처리

```dart
Future<void> fetchData() async {
  var result = await getData();
  print(result);
}
```

---

# 🧩 Flutter 기본 위젯 구조

---

## 1. 앱 시작점

```dart
void main() {
  runApp(MyApp());
}
```

## 2. StatelessWidget

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello Flutter'),
        ),
      ),
    );
  }
}
```

## 3. StatefulWidget

```dart
class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int counter = 0;

  void _increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Count: \$counter')),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        child: Icon(Icons.add),
      ),
    );
  }
}
```

---

# 📋 기타 유용한 정보

---

## 📄 pubspec.yaml 예시

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.14.0
  shared_preferences: ^2.2.0
```

## 🔧 에뮬레이터 실행

```bash
flutter emulators --launch <emulator_id>
flutter run
```
