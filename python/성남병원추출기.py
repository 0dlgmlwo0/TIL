import pandas as pd
import os

# 성남시 병원 코드 불러오기
성남_코드_파일 = "성남시코드.xlsx"
성남_코드_df = pd.read_excel(성남_코드_파일)
성남_코드_셋 = set(성남_코드_df["암호화요양기호"].astype(str))

# 작업할 엑셀 파일들이 들어있는 폴더
엑셀_폴더 = "엑셀"
저장_폴더 = "결과"

# 결과 저장 폴더가 없으면 생성
os.makedirs(저장_폴더, exist_ok=True)

# 폴더 내 모든 엑셀 파일 반복
for 파일명 in os.listdir(엑셀_폴더):
    if 파일명.endswith(".xlsx"):
        경로 = os.path.join(엑셀_폴더, 파일명)
        try:
            df = pd.read_excel(경로)
            if "암호화요양기호" not in df.columns:
                print(f"[!] {파일명}: '암호화요양기호' 컬럼 없음. 건너뜀.")
                continue

            # 문자열로 변환 후 필터링
            df["암호화요양기호"] = df["암호화요양기호"].astype(str)
            성남_병원_df = df[df["암호화요양기호"].isin(성남_코드_셋)]

            if not 성남_병원_df.empty:
                저장_이름 = os.path.splitext(파일명)[0] + "_성남.csv"
                저장_경로 = os.path.join(저장_폴더, 저장_이름)
                성남_병원_df.to_csv(저장_경로, index=False, encoding="utf-8-sig")
                print(f"[✔] {파일명} → {저장_이름} 저장 완료")
            else:
                print(f"[-] {파일명}: 성남 병원 없음.")

        except Exception as e:
            print(f"[에러] {파일명}: {e}")
