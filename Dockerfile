FROM python:3.10-slim

COPY requirements.txt /tmp
RUN pip install -r /tmp/requirements.txt
COPY . /app
WORKDIR /app
EXPOSE 8501

CMD ["streamlit", "run", "app/app.py"]
