FROM node:14 AS builder
WORKDIR /app
COPY ./package.json ./
RUN yarn
COPY . .
RUN yarn build


FROM node:14
WORKDIR /app
COPY --from=builder /app ./
CMD ["yarn", "start:prod"]
