# 'as builder' is to tag phase with a name
FROM node:alpine as builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
# Copy over something from another phase 
COPY --from=builder /app/build /usr/share/nginx/html

