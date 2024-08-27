# Stage 1: Build the Next.js application
FROM node:16-alpine as builder
WORKDIR /app
COPY package.json ./ 
RUN npm install
COPY . .
RUN npm run build
FROM node:16-alpine AS runner
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
EXPOSE 3000
ENV NODE_ENV=production
CMD ["npm", "run", "start"]