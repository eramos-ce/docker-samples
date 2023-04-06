export SECRET_FROM_ENV=my-secret-from-env
DOCKER_BUILDKIT=1 docker build --secret id=SECRET_FROM_ENV --secret id=secret-file.txt,src=secret-file.txt -t secrets:latest . 