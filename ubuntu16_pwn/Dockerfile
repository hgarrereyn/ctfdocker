FROM ubuntu:16.04
ENV TERM xterm-256color

RUN apt-get update && \
    apt-get -y install \
    zsh \
    curl

RUN apt-get install -y python2.7 python-pip python-dev git libssl-dev libffi-dev build-essential

RUN pip install --upgrade pwntools

RUN apt-get -y install \
    gdb \
    wget

RUN mkdir /home/tools \
    && cd /home/tools \
    && git clone https://github.com/pwndbg/pwndbg \
    && cd pwndbg \
    && ./setup.sh 

RUN apt-get install -y socat

RUN pip install numpy

RUN apt-get -y install ruby-dev
RUN gem install one_gadget

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386

COPY ./scripts /home/scripts
COPY ./config /home/config

RUN . /home/config/.bashrc

WORKDIR /home/work

ENV PATH="/home/scripts/bin:${PATH}"

CMD /bin/zsh
