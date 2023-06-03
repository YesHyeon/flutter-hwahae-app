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

filepath = settings.CSV_PATH

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
        print(final)
        
        return JsonResponse({'result': final[0], 'score':final[1]})
    else:
        return JsonResponse({'message': 'POST error.'}, status=400)


