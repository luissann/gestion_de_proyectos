FROM python:3.10-slim
FROM jenkins/jenkins:lts

# Actualizar pip
RUN python -m ensurepip --upgrade && \
    pip install --no-cache --upgrade pip

# Instalar dependencias adicionales si es necesario
# RUN apt-get update && apt-get install -y <additional-packages>

# Copiar el contenido del proyecto al contenedor
COPY . /app
WORKDIR /app

# Instalar las dependencias del proyecto
RUN pip install --no-cache-dir -r requirements.txt

# Comando por defecto para ejecutar la aplicación
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
