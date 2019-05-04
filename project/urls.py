# https://docs.djangoproject.com/en/1.10/topics/http/urls/
from django.urls import path, include
from django.contrib import admin
from django.views.generic import RedirectView

urlpatterns = [
    path('', include('app.urls')),
    path('admin/', admin.site.urls),
]
