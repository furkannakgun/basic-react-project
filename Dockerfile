# Stage 1: Build the React app
FROM node:16.14.0-alpine AS build

WORKDIR /app

COPY my-app/package*.json ./

RUN npm install

COPY . .

RUN npm run build


# Stage 2: Serve the React app with Nginx
FROM nginx:1.21.3-alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

#neden multistage dockerfile, faydakarı ne bak. uçtan uca react prohesi