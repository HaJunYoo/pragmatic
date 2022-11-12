FROM python:3.9.0
# 파이썬 공식 이미지 사용

WORKDIR /home/
# 리눅스 환경에 들어가서 home 디렉토리로 이동

RUN git clone https://github.com/HaJunYoo/pragmatic.git
# 소스 코드 가져온다 -> pragmatic 폴더 생김

WORKDIR /home/pragmatic/
# pragmatic으로 경로 이동

RUN pip install -r requirements.txt
# 필요한 라이브러리 모두 설치

RUN pip install gunicorn

RUN echo "SECRET_KEY=django-insecure-9c7jsx39u&=b@a2h&1=3=wcwh!bvh&22)2kwqyh=mg&&ylw_l@" > .env
# 시크릿 키가 들어간 env 파일이 생긴다

RUN python manage.py migrate

EXPOSE 8000
# 내부 쟝고 컨테이너 8000 포트 노출

CMD ["gunicorn", "pragmatic.wsgi", "--bind", "0.0.0.0:8000"]