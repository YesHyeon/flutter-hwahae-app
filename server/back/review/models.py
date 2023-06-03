from django.db import models
from django.core.validators import MinValueValidator, MaxValueValidator

# Create your models here.
class Review(models.Model):
    result = models.CharField(max_length=15, default='긍정적인 리뷰')
    score = models.FloatField(validators=[MinValueValidator(0,100),MaxValueValidator(100.000)], default=100.000)