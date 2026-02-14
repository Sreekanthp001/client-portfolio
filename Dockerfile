FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install

# 1. Mundu motham files copy cheyali
COPY . .

# 2. Files copy ayyaka, aa tharvatha API folder ni lepeyalai
RUN rm -rf app/api

# 3. Ippudu build kottali
ENV NEXT_PUBLIC_SENTRY_DSN=""
ENV SENTRY_IGNORE_API_RESOLUTION_ERROR=1
RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/out /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]