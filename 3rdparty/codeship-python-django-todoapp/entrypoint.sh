#!/bin/sh
set -e

sleep 7 && python manage.py migrate && gunicorn -b 0.0.0.0:8000 todosapp.wsgi:application
