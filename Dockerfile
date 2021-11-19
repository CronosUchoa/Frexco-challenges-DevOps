#imagem de origem
FROM node:14-alpine

# Diretório de trabalho(é onde a aplicação ficará dentro do container).
WORKDIR /app

# Adicionando `/app/node_modules/.bin` para o $PATH
ENV PATH /app/node_modules/.bin:$PATH

# Instalando dependências da aplicação e armazenando em cache.
COPY package.json /app/package.json
RUN npm install 
RUN npm install react-scripts@4.0.3 -g 

#copiar tudo que tiver nesssa pasta
COPY . .

# Inicializa a aplicação
CMD ["npm", "start"]

## depois dessa configuração eu usei o comando:
##docker build -t docker-react
## t é de tag

#Comando pra colocar o container no ar
#como padrão o react começa na 3000 então eu posso ouvir a porta 3000 e direcionar pra porta 3030
#docker run -p 3030:3000 -d docker-react

#or docker run -p 3030:3000 -d --rm docker-react  ## rm remove o container e os volumes, depois que o container for finalizado.
#docker ps =  pra ver os container no ar
#comando pra apagar o container docker container rm <id> -f

#Crie a imagem e ative o container:
#docker-compose up -d --build

#docker-compose stop