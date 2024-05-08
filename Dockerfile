FROM node:18-alpine

EXPOSE 3000

WORKDIR /app
COPY . .

ENV NODE_ENV=production

RUN npm install --omit=dev
RUN npm remove @shopify/app @shopify/cli
RUN npm run build

RUN rm -f prisma/dev.sqlite

CMD ["npm", "run", "docker-start"]
