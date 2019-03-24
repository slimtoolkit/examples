from django.conf.urls import url, include

urlpatterns = [
    url(r'^todos/', include('todos.urls', namespace='todos')),
]
