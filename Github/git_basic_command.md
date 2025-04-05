
# 🐙 Git 기본 명령어 정리

Git은 버전 관리를 위한 도구로, 코드를 저장하고 변경사항을 추적하며 협업을 원활하게 만들어줍니다.  
이 문서는 Git을 처음 접하는 사람도 이해할 수 있도록 **명령어와 관련 용어 설명을 함께 정리**한 것입니다.

---

## ✅ 1. Git 초기 설정

```bash
git config --global user.name "Your Name"
git config --global user.email "your@email.com"
```

> 🔹 Git 사용자 이름과 이메일을 전역(global)으로 설정합니다. 커밋 기록에 사용됩니다.

---

## ✅ 2. 로컬 저장소 초기화

```bash
git init
```

> 🔹 현재 디렉토리를 Git 저장소로 초기화합니다. `.git` 폴더가 생성되며 Git이 버전을 추적하기 시작합니다.

---

## ✅ 3. 기존 프로젝트에 Git 연결

```bash
git remote add origin https://github.com/yourname/repo.git
```

> 🔹 `origin`이라는 이름으로 원격 저장소를 연결합니다. 보통 GitHub의 레포지토리를 연결할 때 사용됩니다.

---

## ✅ 4. 변경사항 커밋

```bash
git add .               # 모든 변경사항을 스테이징
git commit -m "메시지"  # 커밋 메시지를 작성하여 저장
```

> 🔹 `git add`는 작업한 파일을 커밋 준비 영역(Stage)에 올리고,  
> 🔹 `git commit`은 실제로 변경사항을 Git에 저장하는 작업입니다.

---

## ✅ 5. 원격 저장소에 푸시

```bash
git push origin main     # main 브랜치에 푸시
git push -u origin main  # 최초 푸시 시 브랜치 추적 정보 설정
```

> 🔹 로컬 저장소의 변경사항을 원격 저장소(GitHub 등)에 업로드합니다.

---

## ✅ 6. 원격 저장소 클론

```bash
git clone https://github.com/yourname/repo.git
```

> 🔹 GitHub 같은 원격 저장소에 있는 프로젝트를 복사해옵니다.

---

## ✅ 7. 상태 확인 & 로그 보기

```bash
git status     # 현재 변경된 파일 상태 확인
git log        # 커밋 내역 로그 보기
```

> 🔹 `status`는 어떤 파일이 변경되었는지, 커밋되지 않았는지를 보여줍니다.  
> 🔹 `log`는 지금까지의 커밋 내역을 확인할 수 있습니다.

---

## ✅ 8. 브랜치 관련

```bash
git branch                    # 브랜치 목록 보기
git branch new-branch         # 새 브랜치 생성
git checkout new-branch       # 해당 브랜치로 이동
git checkout -b new-branch    # 브랜치 생성 후 이동
git merge 브랜치명            # 브랜치 병합
```

> 🔹 브랜치는 독립적으로 작업할 수 있는 공간입니다.  
> 🔹 새로운 기능을 만들거나 버그를 수정할 때 각각 브랜치를 만들어 작업합니다.

---

## ✅ 9. Pull & Fetch

```bash
git pull       # 원격 저장소의 변경사항을 받아와 병합
git fetch      # 변경사항만 받아오고 병합은 하지 않음
```

> 🔹 `pull`은 최신 코드를 가져오고 자동 병합까지 진행합니다.  
> 🔹 `fetch`는 일단 받아오기만 하고 병합은 수동으로 해야 합니다.

---

## ✅ 10. 기타 유용한 명령어

```bash
git remote -v             # 연결된 원격 저장소 URL 확인
git diff                  # 변경된 내용 확인
git reset --hard HEAD     # 마지막 커밋 상태로 되돌리기 (위험!)
git rm --cached 파일명    # 파일 추적 제거 (.gitignore 추가 후 사용)
```

---

## 📚 주요 Git 용어 정리

| 용어 | 설명 |
|------|------|
| **Repository (레포지토리)** | Git이 코드와 변경사항을 저장하는 공간 |
| **Commit (커밋)** | 특정 시점의 변경사항을 기록한 것 |
| **Branch (브랜치)** | 독립적으로 작업할 수 있는 라인 |
| **Merge (병합)** | 브랜치의 내용을 현재 브랜치에 통합 |
| **Remote (원격 저장소)** | GitHub 등 인터넷에 있는 저장소 |
| **Stage / Staging Area** | 커밋 전에 준비해두는 임시 공간 |
| **HEAD** | 현재 작업 중인 브랜치를 가리키는 포인터 |

---
