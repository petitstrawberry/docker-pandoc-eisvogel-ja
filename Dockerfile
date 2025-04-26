ARG pandoc_version="3.6.4-ubuntu"
FROM pandoc/latex:${pandoc_version}

ARG pandoc_version

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    wget \
    unzip

RUN tlmgr update --self \
    && tlmgr option repository http://mirror.ctan.org/systems/texlive/tlnet \
    && tlmgr install \
       adjustbox \
       babel-japanese \
       background \
       collectbox \
       everypage \
       footmisc \
       footnotebackref \
       fvextra \
       luatexja \
       ly1 \
       mdframed \
       mweights \
       needspace \
       pagecolor \
       sourcecodepro \
       sourcesanspro \
       titling \
       zref \
       haranoaji \
       ipaex \
       lineno \
       koma-script

ARG eisvogel_version="3.1.0"
RUN mkdir -p /usr/local/share/pandoc/templates \
    && wget https://github.com/Wandmalfarbe/pandoc-latex-template/releases/download/v${eisvogel_version}/Eisvogel-${eisvogel_version}.zip \
    && unzip Eisvogel-${eisvogel_version}.zip -d /tmp/eisvogel \
    && mv /tmp/eisvogel/Eisvogel-${eisvogel_version}/eisvogel.latex /usr/local/share/pandoc/templates/eisvogel.latex

RUN mkdir -p RUN mkdir -p /usr/local/share/pandoc
COPY default.yaml /usr/local/share/pandoc/defaults/default.yaml
COPY default.yaml /usr/local/share/pandoc/defaults/default.yaml

ENTRYPOINT [ "/usr/local/bin/pandoc", "-d", "default" ]
