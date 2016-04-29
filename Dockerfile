FROM qnib/u-syslog

ENV ANACONDA_VER=4.0.0 \
    ANACONDA_PY_VER=2
RUN apt-get install -y wget bzip2 \
 && echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh \
 && wget --quiet https://repo.continuum.io/archive/Anaconda${ANACONDA_PY_VER}-${ANACONDA_VER}-Linux-x86_64.sh \
 &&  /bin/bash /Anaconda${ANACONDA_PY_VER}-${ANACONDA_VER}-Linux-x86_64.sh -b -p /opt/conda \
 && rm /Anaconda${ANACONDA_PY_VER}-${ANACONDA_VER}-Linux-x86_64.sh 
ENV PATH=/opt/conda/bin:$PATH \
# http://bugs.python.org/issue19846
# > At the moment, setting "LANG=C" on a Linux system *fundamentally breaks Python 3*, and that's not OK.
    LANG=C.UTF-8
