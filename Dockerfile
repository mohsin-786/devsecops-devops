FROM node:alpine as build

WORKDIR /app

COPY . .

RUN npm install

############################
FROM gcr.io/distroless/nodejs20-debian12

WORKDIR /app

#COPY --from=build /usr/local/lib/node_modules ./node_modules

COPY --from=build /app .

#ENV NODE_PATH ./node_modules

CMD ["app.js"]
