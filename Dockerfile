FROM ubuntu
MAINTAINER pluckyman

RUN apt-get update
RUN apt-get install -y git vim gdb tig bash mercurial curl wget

RUN cd /usr/local && wget https://dl.google.com/go/go1.11.1.linux-amd64.tar.gz && tar -C /usr/local -xzf /usr/local/go1.11.1.linux-amd64.tar.gz && rm /usr/local/go1.11.1.linux-amd64.tar.gz

#COPY go1.11.1.linux-amd64.tar.gz /usr/local
#RUN tar -C /usr/local -xzf /usr/local/go1.11.1.linux-amd64.tar.gz

RUN adduser --disabled-password --gecos '' go

COPY vim /home/go/.vim
COPY vimrc /home/go/.vimrc
COPY screenrc /home/go/.screenrc
COPY bashrc /home/go/.bashrc
RUN chown -R go:go /home/go/.vim /home/go/.vimrc /home/go/.screenrc /home/go/.bashrc

USER go
WORKDIR /home/go

RUN mkdir -p /home/go/golang/bin
RUN mkdir -p /home/go/.vim/autoload /home/go/.vim/bundle
RUN git clone https://github.com/fatih/vim-go.git /home/go/.vim/bundle/vim-go
RUN curl -LSso /home/go/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install dep
RUN export PATH=/usr/local/go/bin:$PATH && export GOPATH=/home/go/golang && curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

#RUN . /home/go/.bashrc && vim -c GoInstallBinaries

CMD source ~/.bashrc
