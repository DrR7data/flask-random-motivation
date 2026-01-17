head:
	@echo "For work with random frases of motivations"
venv: 
	virtualenv ~/.venv\
	&& source ~/.venv/bin/activate

install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	pylint --disable=R,C,W1203,W0702 app.py

test:
	python -m pytest -vv --cov=app test_app.py

format:
	black *.py

all: install lint test format

app:
	python3 app.py
pull:#pull of docker hub to local
	docker pull ramr2900/flask-random  
run-h:#deploy the docker pull
	docker run -it -p 127.0.0.1:8080:8080 --name flask-random ramr2900/flask-random  
build:#Docker
	docker build . -t flask-random
build-d:
	docker buildx build \
	--platform linux/amd64,linux/arm64 \
	--tag ramr2900/flask-random:latest \
	--push \
	.   
run:#local
	docker run -it -p 127.0.0.1:8080:8080 --name flask-random flask-random
run-h:#local
	docker run -it -p 127.0.0.1:8080:8080 --name flask-random ramr2900/flask-random

start:
	docker start flask-random
stop:
	docker stop flask-random
exec:
	docker exec -it flask-random sh
delete:
	docker rm flask-random
	docker rmi flask-random


hello:# write for prove function of this file
	@echo "Hello everyone, All Right"