FROM node:23-slim

# Atualize os pacotes e instale o Chromium sem deixar arquivos desnecessários
RUN apt-get update && apt-get install -y chromium && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copie apenas os arquivos necessários para instalar as dependências
COPY package.json package-lock.json ./

RUN npm install

COPY . .

CMD ["npm", "start"]
