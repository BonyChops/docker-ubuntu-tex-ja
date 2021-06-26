FROM korosuke613/ubuntu-texlive-ja:latest

RUN apt update -y && \
    apt install -y\
    git \
    bzip2 \
    texlive-extra-utils \
    make && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    wget "https://osdn.net/frs/redir.php?m=liquid&f=mytexpert%2F26068%2Fjlisting.sty.bz2" -O jlisting.sty.bz2 &&\
    bzip2 -d jlisting.sty.bz2 &&\
    mv jlisting.sty /usr/share/texlive/texmf-dist/tex/latex/listing/  &&\
    mktexlsr &&\
    git clone https://github.com/BonyChops/tex-packages --depth=1 &&\
    cd tex-packages &&\
    sh manual-install.sh &&\
    cd ../ \
    rm -r tex-packages \
    wget https://gist.githubusercontent.com/BonyChops/1e2cdad0a27e637c9c9fa66e8a3ca0b9/raw/766858b4121044b8484d29f595d06154f7c017fe/.latexmkrc -O ~/.latexmkrc &&\
    echo Done.

WORKDIR /workdir

VOLUME ["/workdir"]

CMD ["bash"]