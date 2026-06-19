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
build:#Docker
	docker build . -t flask-random
run:
	docker run -it -p 127.0.0.1:8080:8080 --name flask-random flask-random
start:
	docker start flask-random
stop:
	docker stop flask-random
exec:
	docker exec -it flask-random sh
delete:
	docker rm flask-random
	docker rmi flask-random
up:
	docker compose up -d
down:
	docker compose down

hello:# write for prove function of this file
	@echo "Hello everyone, All Right"