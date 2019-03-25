
from todos.serializers import TodoSerializer
from todos.models import Todos
from rest_framework import generics
# from rest_framework_bulk import BulkDestroyAPIView

# TODO: Add delete all todos, add url to responses, enable CORS properly

class TodoList(generics.ListCreateAPIView):
    queryset = Todos.objects.all()
    serializer_class = TodoSerializer

    def perform_create(self, serializer):
        serializer.save()

class TodoDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Todos.objects.all()
    serializer_class = TodoSerializer
