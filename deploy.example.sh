# rename this file to deploy.sh
# add APP_ID after making a github app
# generate a secret using "openssl rand -base64 32"
# you'll also use that secret in the github app
# after creating an app download the private-key and place in the root
# of this project
now rm charitas-github-bot -y || true && \
now --public -e APP_ID= \
     -e SECRET= \
     -e NODE_ENV=production \
     -e LOG_LEVEL=trace \
     -e PORT=80 \
     -e PRIVATE_KEY_BASE64="$(cat ./*.private-key.pem | base64)" && \
now alias