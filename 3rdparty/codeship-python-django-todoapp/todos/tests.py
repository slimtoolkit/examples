import json
from django.urls import reverse
from todos.models import Todos
from todos.serializers import TodoSerializer
from rest_framework import status
from rest_framework.test import APITestCase

class TodoListCreateAPIViewTestCase(APITestCase):
    url = reverse('todos:list')

    def setUp(self):
        Todos.objects.create(title='Go to Tosche station')
        Todos.objects.create(title='Buy power converters')
        Todos.objects.create(title='Clean up droids')

    def test_create_todo(self):
        response = self.client.post(
            self.url,
            {'title': 'Find pilot in Mos Eisley '},
            format="json"
        )

        self.assertEqual(201, response.status_code)

    def test_get_todos(self):
        Todos.objects.create(title='Rescue Princess')
        response = self.client.get(self.url)
        self.assertTrue(len(json.loads(response.content)) == Todos.objects.count())

    # def test_delete_todos(self):
    #     response = self.client.delete(self.url)
    #     self.assertEqual(204, response.status_code)

class TodoDetailAPIViewTestCase(APITestCase):

    def setUp(self):
        self.todo = Todos.objects.create(title='Bullseye womp rats')
        self.url = reverse("todos:details", kwargs={"pk": self.todo.id})

    def test_todo_object_bundle(self):
        response = self.client.get(self.url)
        self.assertEqual(200, response.status_code)
        todo_serializer_data = TodoSerializer(instance=self.todo).data
        response_data = json.loads(response.content)
        self.assertEqual(todo_serializer_data.get('title'), response_data.get('title'))

    def test_todo_object_url(self):
        todo = self.client.get(self.url)
        todo_data = json.loads(todo.content)
        response = self.client.get(todo_data.get('url'))
        self.assertEqual(200, response.status_code)
        response_data = json.loads(response.content)
        self.assertEqual(todo_data, response_data)


    def test_todo_object_update(self):
        response = self.client.put(self.url, {"title": "Visit Alderaan"})
        response_data = json.loads(response.content)
        todo = Todos.objects.get(id=self.todo.id)
        self.assertEqual(response_data.get("title"), todo.title)

    def test_todo_object_partial_update_completed(self):
        response = self.client.patch(self.url, {"completed": True})
        response_data = json.loads(response.content)
        todo = Todos.objects.get(id=self.todo.id)
        self.assertEqual(response_data.get("completed"), todo.completed)

    def test_todo_object_partial_update_order(self):
        response = self.client.patch(self.url, {"order": 10})
        response_data = json.loads(response.content)
        todo = Todos.objects.get(id=self.todo.id)
        self.assertEqual(response_data.get("order"), todo.order)

    def test_todo_object_delete(self):
        response = self.client.delete(self.url)
        self.assertEqual(204, response.status_code)
