FROM alpine:3.16

RUN apk update && \
    apk add curl \
    bash

RUN curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | sh

RUN mv /root/.local/bin/lazydocker /usr/bin/
RUN ln -s /usr/bin/lazydocker /usr/bin/lzd