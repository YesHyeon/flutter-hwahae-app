import scipy as sp
import pandas as pd
import numpy as np
import scipy as sp

from konlpy.tag import Kkma       ; kkma = Kkma()
from konlpy.tag import Hannanum   ; hannanum = Hannanum()
from konlpy.tag import Okt        ; t = Okt()
from konlpy.tag import *
import pickle

from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.linear_model import LogisticRegression
from sklearn.pipeline import Pipeline
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split

from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.linear_model import LogisticRegression
from sklearn.pipeline import Pipeline
from sklearn.metrics import accuracy_score
from konlpy.tag import *

# import tensorflow as tf

class ReviewAnalyzer:
  def __init__(self):
    self.model = None
    self.pipe = None
    self.posorNeg = None
    self.score = None
  
  # 평점 전처리 함수
  def star_preprocessing(self, value) :
    if value <= 3 :
        return '0'
    else :
        return '1'

  # 형태소 분석을 위한 함수
  def tokenizer(self, text) :
    okt = Okt()
    return okt.morphs(text)

  def data_preprocessing(self, file_path) :
    df = pd.read_csv(file_path)

    # 전처리를 수행한다.
    df['rating'] = df['rating'].apply(self.star_preprocessing)

    # 학습데이터와 테스트 데이터로 나눈다.
    text_list = df['review'].tolist()
    star_list = df['rating'].tolist()

    # 80%는 학습, 20%는 test
    return train_test_split(text_list, star_list, test_size=0.2, random_state=0)

  def learning(self, file_path):
    X_train, X_test, y_train, y_test = self.data_preprocessing(file_path)
    # 주어진 데이터를 단어 사전으로 만들고 각 단어의 빈도수를 계산한 후 벡터화 하는 객체 생성
    tfidf = TfidfVectorizer(lowercase=False, tokenizer=self.tokenizer)
    # 문장별 나오는 단어수 세서 수치화, 벡터화해서 학습
    logistic = LogisticRegression(C=10.0, penalty='l2', random_state=0)
    self.pipe = Pipeline([('vect', tfidf), ('clf', logistic)])
    self.pipe.fit(X_train, y_train)
    # 학습 정확도 측정
    y_pred = self.pipe.predict(X_test)
    print(accuracy_score(y_test, y_pred))
    # 학습된 모델을 저장
    with open('pipe.dat', 'wb') as fp :
        pickle.dump(self.pipe, fp)
    print('저장완료')

  def load_model(self) :
      # 객체를 복원한다.
    with open('pipe.dat', 'rb') as fp:
        self.pipe = pickle.load(fp)

  def analyze(self, text):
    if self.pipe is None:
        print('모델을 먼저 로드하세요.')
        return

    str = [text]
    r1 = np.max(self.pipe.predict_proba(str) * 100)
    r2 = self.pipe.predict(str)[0]

    if r2 == '1':
        self.posorNeg = 'POSITIVE'
    else:
        self.posorNeg = 'NEGATIVE'

    self.score = '%.3f' % r1

    return self.posorNeg, self.score