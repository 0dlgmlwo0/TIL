
# Android Studio 사용법 가이드

## 📌 목차
1. Android Studio란?
2. 설치 방법
3. 새 프로젝트 만들기
4. 프로젝트 구조 이해하기
5. 에뮬레이터 실행하기
6. 기본 UI 만들기
7. 코드 작성 및 실행
8. 자주 발생하는 오류와 해결법

---

## 1. Android Studio란?
Android Studio는 Google에서 공식 지원하는 **안드로이드 앱 개발 도구**입니다. Java 또는 Kotlin을 사용하여 앱을 만들 수 있으며, 시각적인 UI 에디터와 강력한 디버깅 기능을 제공합니다.

---

## 2. 설치 방법

### 📥 설치 파일 다운로드
1. [공식 홈페이지](https://developer.android.com/studio)에서 OS에 맞는 설치 파일을 다운로드
2. 설치 파일 실행 후 **권장 설정(Default)**으로 설치 진행

### ⚙️ 필수 구성 요소
- **JDK**: Android Studio 설치 시 자동 포함
- **Android SDK**: 첫 실행 시 설치됨

---

## 3. 새 프로젝트 만들기

### 📁 새 프로젝트 생성
1. Android Studio 실행 → **"New Project"** 클릭
2. 템플릿 선택: 예) **Empty Activity**
3. 프로젝트 정보 입력:
   - **Name**: 프로젝트 이름
   - **Package name**: com.example.myapp
   - **Save location**: 저장 경로
   - **Language**: Kotlin 또는 Java
   - **Minimum SDK**: API 21 이상 권장

---

## 4. 프로젝트 구조 이해하기

```plaintext
MyApplication/
├── app/
│   ├── java/                 # 소스 코드
│   ├── res/                  # 리소스 파일 (layout, drawable 등)
│   └── AndroidManifest.xml   # 앱 구성 정보
├── build.gradle              # 프로젝트 설정 파일
└── gradle/                   # 빌드 시스템 관련
```

---

## 5. 에뮬레이터 실행하기

### 가상 디바이스 생성 (AVD)
1. 상단 툴바에서 **Device Manager** 아이콘 클릭
2. **Create Device** → 원하는 모델 선택 (예: Pixel 6)
3. 시스템 이미지 선택 (예: Android 13)
4. 이름 지정 후 완료

### 실행
- 상단 툴바에서 ▶️ 버튼 클릭 → 가상 디바이스에서 앱 실행

---

## 6. 기본 UI 만들기

### XML 레이아웃 편집
`res/layout/activity_main.xml` 파일 열기

```xml
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout
    xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:padding="16dp">

    <TextView
        android:id="@+id/textView"
        android:text="Hello Android!"
        android:textSize="24sp"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"/>
</LinearLayout>
```

---

## 7. 코드 작성 및 실행

### `MainActivity.kt`

```kotlin
package com.example.myapp

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
   override fun onCreate(savedInstanceState: Bundle?) {
       super.onCreate(savedInstanceState)
       setContentView(R.layout.activity_main)
   }
}
```

### 실행 방법
- ▶️ 버튼 클릭 또는 **Shift + F10**으로 앱 실행

---

## 8. 자주 발생하는 오류와 해결법

| 오류 | 원인 | 해결 방법 |
|------|------|------------|
| `Gradle sync failed` | 네트워크 문제 또는 설정 오류 | **File > Sync Project with Gradle Files** 클릭 |
| `Emulator not responding` | 에뮬레이터 속도 문제 | RAM 설정 낮추기, HAXM 재설치 |
| `R cannot be resolved` | 리소스 문제 | XML에 오타가 있는지 확인, 프로젝트 Clean 후 Rebuild |

---

## 📚 추가 학습 자료
- [Android Developers 공식 문서](https://developer.android.com/)
- [Kotlin 언어 문서](https://kotlinlang.org/docs/home.html)
- YouTube 채널: **코딩셰프**, **코딩애플**

---

## 🙋‍♂️ 팁
- **단축키 정리**:  
  - 실행: `Shift + F10`  
  - 코드 자동 정렬: `Ctrl + Alt + L`  
  - 전체 검색: `Double Shift`
