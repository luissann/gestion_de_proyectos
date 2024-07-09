# Usar una imagen base oficial de Python
FROM python:3.10-slim

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar los archivos de requisitos y el script de entrada
COPY requirements.txt /app/

# Instalar las dependencias
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el código fuente del proyecto en el contenedor
COPY . /app

# Exponer el puerto 8000
EXPOSE 8000

# Definir el comando de inicio del contenedor
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
