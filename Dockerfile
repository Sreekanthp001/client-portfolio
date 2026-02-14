FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
# Next.js static export use chesthe 'out' folder untundi. 
# Normal build ayithe '.next' untundi. General ga static serve ki 'out' use chestham.
COPY --from=builder /app/out /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]