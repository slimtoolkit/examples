FROM public.ecr.aws/lambda/nodejs:14

#default working directory - ${LAMBDA_TASK_ROOT}
COPY *.json ./
RUN npm ci
COPY app.js ./
EXPOSE 8080

CMD ["app.handler"]
