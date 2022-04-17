FROM node:16

WORKDIR /app

COPY package.json package-lock.json tsconfig.build.json tsconfig.json .eslintrc.js .prettierrc ./
RUN npm ci --production

COPY ./src ./src
RUN npm run build

EXPOSE 3000
CMD ["sh", "-c", "npm run start:prod"]
