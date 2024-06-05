# Establece la imagen base
FROM node:14

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el archivo package.json y package-lock.json (si existe)
COPY package*.json ./

# Instala las dependencias del proyecto
RUN npm install

# Copia todo el código fuente al directorio de trabajo del contenedor
COPY . .

# Expone el puerto 3000 para que la aplicación pueda ser accesible desde fuera del contenedor
EXPOSE 3000

# Define el comando para ejecutar la aplicación cuando se inicie el contenedor
CMD ["node", "index.js"]
