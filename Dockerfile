FROM apache/airflow:2.6.2


USER root

RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libpq-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


USER airflow

# Clonar el repositorio de DAGs en un directorio temporal
RUN git clone https://github.com/smars1/Airflow_dags_testing.git /tmp/repo && \
    mv /tmp/repo/dags/* /opt/airflow/dags/ && \
    rm -rf /tmp/repo

# Instalar las dependencias de Python si es necesario
COPY requirements.txt /requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /requirements.txt



# Comando para iniciar el scheduler
CMD ["airflow", "scheduler"]
