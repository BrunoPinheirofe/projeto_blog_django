from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('post/', views.post, name='index'),
    path('page/', views.page, name='index'),
]

