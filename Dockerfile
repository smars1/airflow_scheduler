FROM apache/airflow:2.6.2

USER airflow

# Instalar las dependencias de Python si es necesario
COPY requirements.txt /requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /requirements.txt

# Comando para iniciar el scheduler
CMD ["airflow", "scheduler"]
