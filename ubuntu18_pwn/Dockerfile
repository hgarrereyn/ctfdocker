FROM ubuntu:18.04
ENV TERM xterm-256color

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install \
    zsh \
    python3 \
    python3-pip \
    curl

RUN pip3 install angr
RUN pip3 install jupyterlab

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

COPY ./scripts /home/scripts
COPY ./config /home/config

RUN . /home/config/.bashrc

WORKDIR /home/work

ENV PATH="/home/scripts/bin:${PATH}"

CMD /bin/zsh
