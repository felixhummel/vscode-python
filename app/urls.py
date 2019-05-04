from django.urls import path, include

from app import views

# namespacing
app_name = 'app'

urlpatterns = [
    path(r'', views.HelloView.as_view(), name='hello'),
]

