# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG BUILD_FROM
FROM $BUILD_FROM
ENV NPM_CONFIG_PREFIX=/usr/src/app

# Execute during the build of the image.
ARG TEMPIO_VERSION BUILD_ARCH
RUN \
    curl -sSLf -o /usr/bin/tempio \
    "https://github.com/home-assistant/tempio/releases/download/${TEMPIO_VERSION}/tempio_${BUILD_ARCH}"

RUN apk add --no-cache --update nodejs npm gcc make musl-dev libusb dev86 linux-headers eudev-dev

WORKDIR /usr/src/app

RUN npm -g config set user root && npm install --unsafe-perms  -g soma-ctrl

COPY ./entrypoint.sh ./

COPY . .

RUN ["chmod", "+x", "./entrypoint.sh"]

CMD [ "./entrypoint.sh" ]
