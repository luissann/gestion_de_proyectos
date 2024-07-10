FROM jenkins/jenkins:lts

# Instalar Python y actualizar pip
USER root
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    python3 -m pip install --upgrade pip

# Copiar el contenido del proyecto al contenedor
# Asegúrate de ajustar el directorio de tu proyecto si es diferente
COPY . /app
WORKDIR /app

# Instalar las dependencias del proyecto
RUN pip install --no-cache-dir -r requirements.txt

# Cambiar al usuario jenkins
USER jenkins

# Comando por defecto para ejecutar la aplicación
# Ajusta según sea necesario para tu proyecto
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
