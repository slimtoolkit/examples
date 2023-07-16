FROM python:3.9

WORKDIR /code
COPY ./service/requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt
COPY ./service/app /code/app

EXPOSE 1300
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "1300"]
