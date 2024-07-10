FROM jenkins/jenkins:lts

# Instala Python y pip usando apt
USER root
RUN apt-get update && \
    apt-get install -y python3 python3-venv

# Crea y activa un entorno virtual
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# Copia el contenido del proyecto al contenedor
COPY . /app
WORKDIR /app

# Instala las dependencias del proyecto dentro del entorno virtual
RUN pip install --no-cache-dir -r requirements.txt

# Cambia al usuario jenkins
USER jenkins

# Comando por defecto para ejecutar la aplicación
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
