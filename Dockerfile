FROM python:3.12-slim-buster

# Define o diretório de trablho dentro do container
WORKDIR /app

# Copia os arquivos de requisitos e instala as dependências
# Usamos --no-cache-dir para evitar o cache de pacotes do pip, reduzindo o tamanho da imagem
COPY requirements.txt .

# Instala as dependências do projeto
RUN pip install --no-cache-dir -r requirements.txt

# Copia o restante dos arquivos do projeto para o diretório de trabalho
COPY . .

# Exppõe a porta que a aplicação FastAPI irá rodar (padrão é 8000)
EXPOSE 8000

# Comando para iniciar a aplicação usando Uvicorn
# o host 0.0.0.0 permite que a aplicação seja acessada de fora do container
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]

