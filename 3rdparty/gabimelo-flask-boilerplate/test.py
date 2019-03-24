import unittest

from app.server import app


class AppTestCase(unittest.TestCase):
    def setUp(self):
        app.testing = True
        self.app = app.test_client()

    def test_hello_world(self):
        res = self.app.get('/')
        self.assertEqual(res.status_code, 200)
        self.assertIn('Hello World!', str(res.data))

    # TODO need to mock db to be able to run tests below
    # def test_get_users(self):
    #     res = self.app.get('/users')
    #     self.assertEqual(res.status_code, 200)
    #     self.assertIn('Hello World!', str(res.data))

    # def test_post_users(self):
    #     res = self.app.post('/users', data=dict(name='John Doe'))
    #     self.assertEqual(res.status_code, 200)
    #     self.assertIn('success', str(res.data))

    # def test_get_users_after_post(self):
    #     res = self.app.get('/users')
    #     self.assertEqual(res.status_code, 200)
    #     self.assertIn('John Doe', str(res.data))


if __name__ == "__main__":
    unittest.main()
