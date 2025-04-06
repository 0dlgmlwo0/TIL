import pandas as pd
import os

# 성남시 병원 코드 파일 불러오기
성남_코드_파일 = "성남시코드.xlsx"
성남_코드_df = pd.read_excel(성남_코드_파일)
성남_코드_셋 = set(성남_코드_df["암호화요양기호"].astype(str))

# 자동화로 저장된 결과 폴더 위치
결과_폴더 = "결과"

# 병합할 전체 데이터프레임 초기화
전체_병합 = pd.DataFrame()

# 결과 폴더의 모든 성남시 관련 파일 반복
for 파일명 in os.listdir(결과_폴더):
    if 파일명.endswith("_성남.csv"):
        경로 = os.path.join(결과_폴더, 파일명)
        df = pd.read_csv(경로, dtype=str)
        if "암호화요양기호" in df.columns:
            df["암호화요양기호"] = df["암호화요양기호"].astype(str)
            전체_병합 = pd.concat([전체_병합, df], ignore_index=True)

# 성남시 병원 코드만 필터링
전체_병합 = 전체_병합[전체_병합["암호화요양기호"].isin(성남_코드_셋)]

# 병원 코드 기준 정렬
전체_병합.sort_values(by="암호화요양기호", inplace=True)

# 통합된 파일로 저장
전체_병합.to_csv("성남_통합정보.csv", index=False, encoding="utf-8-sig")
print("[✔] 병합 완료: 성남_통합정보.csv 저장됨")

# CSV로 저장
전체_병합.to_csv("성남_통합정보.csv", index=False, encoding="utf-8-sig")

# 엑셀로도 저장
전체_병합.to_excel("성남_통합정보.xlsx", index=False)

