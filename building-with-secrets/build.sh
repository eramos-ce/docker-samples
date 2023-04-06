# Enable Docker buildkit to allow docker build to use secrets
export DOCKER_BUILDKIT=1 
# Define a secret environment variable.  These are typically setup by your CI/CD tool 
# of choice
export SECRET_FROM_ENV=my-secret-from-env

# Run docker build.  This example sets a secret from an environment variable on the CI/CD runner, 
# and sets a secret available on the filesystem of the CI/CD runner.
#
# In this example, our secret file was committed to the repo for simplicity.  DO NOT commit secrets to 
# source control :)
docker build --secret id=SECRET_FROM_ENV --secret id=secret-file.txt,src=secret-file.txt -t building-with-secrets:latest . 

echo "Testing image built with secrets."
docker run building-with-secrets:latest