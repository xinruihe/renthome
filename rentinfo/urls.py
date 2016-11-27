from django.conf.urls import url

from . import services
from . import views

urlpatterns = [
    url(r'^apis/getlistings/(?P<points>[^/]+)$', services.GetListings),
    url(r'^views$', views.index, name='index'),
]
