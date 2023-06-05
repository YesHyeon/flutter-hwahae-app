from django.shortcuts import render
from .models import Review
from .serializers import ReviewSerializer
from rest_framework import viewsets
from rest_framework.response import Response
from django.views.decorators.csrf import csrf_exempt  # CSRF 보안 임시 해제
from django.utils.decorators import method_decorator
from django.http import JsonResponse
from .nlp import ReviewAnalyzer
from django.conf import settings
import numpy as np
import pandas as pd
import os

filepath = settings.CSV_PATH
new_csv_filepath = settings.NEW_CSV_PATH  # 새로운 CSV 파일의 경로와 이름을 지정
# Create your views here.
class ReviewViewSet(viewsets.ModelViewSet):
    queryset = Review.objects.all()
    serializer_class = ReviewSerializer

    def get(self, request):
        dummy = Review.objects.all()
        serializer = ReviewSerializer(dummy, many=True)
        return Response(serializer.data)

# flutter에서 text를 post해주고,
# request==POST일때 get해와서 text를 받아서
# 여기서 분석 코드 거치면 DB에 저장

@method_decorator(csrf_exempt, name="dispatch")
def upload_text(request):
    if request.method == 'POST':
        text = request.POST.get('text')
        print(text)

        analyzer = ReviewAnalyzer()
        analyzer.learning(filepath)  # 학습 데이터 파일 경로를 전달하여 학습 수행
        analyzer.load_model()
        final = analyzer.analyze(text)
        # print(final)
        if final[0] == 'POSITIVE':
            if float(final[1]) >= 80:
                score = 5
            elif float(final[1]) < 80 and float(final[1]) >= 60:
                score = 4
            elif float(final[1]) < 60 and float(final[1]) >= 40:
                score = 3
            elif float(final[1]) < 40 and float(final[1]) >= 20:
                score = 2
            else:
                score = 1
        else:
            if float(final[1]) >= 80:
                score = 1
            elif float(final[1]) < 80 and float(final[1]) >= 60:
                score = 2
            elif float(final[1]) < 60 and float(final[1]) >= 40:
                score = 3
            elif float(final[1]) < 40 and float(final[1]) >= 20:
                score = 4
            else:
                score = 5

        data = pd.read_csv(filepath)
        data = data.drop(data.columns[0], axis=1)

        print("score", score)

        add = [text, score, user_type]
        data.loc[len(data)] = add
        data.to_csv(new_csv_filepath, index=False)  # 데이터프레임을 CSV 파일로 저장

        # 기존의 csv 파일을 삭제
        if os.path.exists(filepath): 
            os.remove(filepath) 

        os.rename(new_csv_filepath, filepath)  # 새로운 CSV 파일의 이름을 변경

        print(data.tail())

        return JsonResponse({'result': final[0], 'score':final[1]})
    else:
        return JsonResponse({'message': 'POST error.'}, status=400)


