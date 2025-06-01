import requests
import xmltodict
import json

url = "https://apis.data.go.kr/B552657/ErmctInfoInqireService/getEmrrmRltmUsefulSckbdInfo"

params = {
    'serviceKey': 'iJsu9ygUVo24pnKXWsntyEmfZtNPVq5WoaRHYNoq7JQv0Jhq3LyRzf/P7QXb3I2Kw1i1lcRBEukiJoZfoWX56g==',
    'STAGE1': '경기도',
    'STAGE2': '성남시 분당구',
    'pageNo': '1',
    'numOfRows': '10'
}

# 테스트용 SSL 인증 무시 (정상 환경에선 제거해야 함)
response = requests.get(url, params=params, verify=False)

# XML → JSON 변환
data_dict = xmltodict.parse(response.text)
print(json.dumps(data_dict, ensure_ascii=False, indent=2))
