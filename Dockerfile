# Dockerfile
FROM python:3.12
WORKDIR /app

# copy everything first (including venvs, cache, tests)
COPY . .

# install deps
RUN pip install -r requirements.txt

# runtime config
ENV PORT=5000
EXPOSE $PORT

# start the app (dev server)
CMD ["python", "app.py"]

#You inherit this Flask app’s container. 
#The image is large, starts slowly, sometimes ignores SIGTERM, and health checks fail during deploys.