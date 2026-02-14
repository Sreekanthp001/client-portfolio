FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install

# Build kante munde API folder ni lepeyadam (Next.js static export error rakunda)
RUN rm -rf app/api

ENV NEXT_PUBLIC_SENTRY_DSN=""
ENV SENTRY_IGNORE_API_RESOLUTION_ERROR=1

COPY . .
RUN npm run build

FROM nginx:alpine
# build success ayyaka 'out' folder ni copy chesthunnam
COPY --from=builder /app/out /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]