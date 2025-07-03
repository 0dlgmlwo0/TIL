# Markdown 작성 요령 정리

Markdown은 문서를 간단한 문법으로 포맷팅할 수 있게 해주는 경량 마크업 언어입니다. GitHub, GitLab, Notion, 블로그 등 다양한 플랫폼에서 사용됩니다.

---

## 1. 제목 (Headers)

```markdown
# 제목 1
## 제목 2
### 제목 3
#### 제목 4
```

---

## 2. 강조 (Emphasis)

```markdown
*기울임* 또는 _기울임_  
**굵게** 또는 __굵게__  
~~취소선~~
```

---

## 3. 목록 (Lists)

### 순서 없는 목록

```markdown
- 항목 1
- 항목 2
  - 하위 항목
* 또는 *로도 작성 가능
```

### 순서 있는 목록

```markdown
1. 첫 번째
2. 두 번째
   1. 하위 항목
```

---

## 4. 링크 (Links)

```markdown
[링크 텍스트](https://example.com)
```

---

## 5. 이미지 (Images)

```markdown
![대체 텍스트](이미지URL)
```

예:
```markdown
![로고](https://upload.wikimedia.org/wikipedia/commons/4/48/Markdown-mark.svg)
```

---

## 6. 코드 (Code)

### 인라인 코드

```markdown
`코드`
```

### 코드 블록

\`\`\`언어
코드 내용
\`\`\`

예:
```markdown
```python
def hello():
    print("Hello Markdown!")
```
```

---

## 7. 수평선 (Horizontal Rules)

```markdown
---
```

---

## 8. 인용문 (Blockquotes)

```markdown
> 인용문
>> 중첩 인용문
```

---

## 9. 체크박스 (To-Do List)

```markdown
- [ ] 할 일 1
- [x] 완료된 일
```

---

## 10. 표 (Tables)

```markdown
| 헤더1 | 헤더2 | 헤더3 |
|-------|-------|-------|
| 셀1   | 셀2   | 셀3   |
| 셀4   | 셀5   | 셀6   |
```

---

## 11. 줄 바꿈

- 일반적으로 한 줄 띄워야 줄 바꿈이 됩니다.
- `<br>` 태그를 쓰면 강제 줄 바꿈 가능..

```markdown
첫 줄  
둘째 줄
```

---

## 12. 주석 (렌더링되지 않음)

```markdown
<!-- 주석 내용 -->
```

---

## 13. 기타 팁

- `README.md` 파일은 보통 프로젝트 설명, 설치 방법, 실행 방법, 사용 예시, 라이선스 등을 포함합니다.
- 리스트나 표 작성 시 한글 줄맞춤이 깨지지 않도록 `|`와 `-` 사이에 공백을 잘 맞추는 것이 좋습니다.
- GitHub에서는 GFM(GitHub Flavored Markdown)을 사용하므로 확장 문법(ex. 체크박스, 표 등)도 지원합니다.

---


