FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install

# Sentry build ni skip cheyadaniki ee env variable add cheyi
ENV NEXT_PUBLIC_SENTRY_DSN=""
ENV SENTRY_IGNORE_API_RESOLUTION_ERROR=1

COPY . .

# Build step lo Sentry errors rakunda 'NEXT_DISABLE_SENTRY=1' or similar padochu
# Next.js export kosam build chesthunnam
RUN npm run build

FROM nginx:alpine
# Next.js static export 'out' folder lo untundi
COPY --from=builder /app/out /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]