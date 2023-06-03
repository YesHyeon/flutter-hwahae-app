from django.urls import path, include
from .views import *
from rest_framework.routers import DefaultRouter

router = DefaultRouter()
router.register('review', ReviewViewSet, basename='review')

urlpatterns = [
    path('', include(router.urls)),
    path('upload/', upload_text, name='upload_text'),
]
