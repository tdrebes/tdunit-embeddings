FROM python:3.10.6-slim-buster

# copy requirements into image
COPY ./requirements.txt /app/requirements.txt

# switch working directory
WORKDIR /app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install the dependencies
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip install -r requirements.txt

# copy files to image
COPY . /app

CMD [ "gunicorn", "-b", "0.0.0.0:5000", "--timeout=120", "app:app" ]
