FROM gcc:9

RUN curl https://cmake.org/files/v3.17/cmake-3.17.0-Linux-x86_64.sh -o /tmp/curl-install.sh \
      && chmod u+x /tmp/curl-install.sh \
      && mkdir /usr/bin/cmake \
      && /tmp/curl-install.sh --skip-license --prefix=/usr/bin/cmake \
      && rm /tmp/curl-install.sh \
      && curl https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py \
      && python /tmp/get-pip.py --no-wheel \
      && rm /tmp/get-pip.py \
      && pip install gcovr
ENV PATH="/usr/bin/cmake/bin:${PATH}"
RUN curl -Lj0 https://github.com/google/googletest/archive/release-1.10.0.zip -o /tmp/gtest.zip \
      && cd /tmp \
      && unzip gtest.zip \
      && cd googletest-release-1.10.0 \
      && cmake  -DBUILD_SHARED_LIBS=ON . \
      && make \
      && make install \
      && cd .. \
      && rm gtest.zip \
      && rm -rf googletest-release-1.10.0 \

