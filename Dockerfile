FROM ubuntu:20.04

# install global deps
RUN apt-get update && apt-get install -y curl unzip

WORKDIR /


# arduino cli
RUN curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh -s 0.34.1
COPY arduino/arduino-cli.yaml /root/.arduino15/arduino-cli.yaml
RUN arduino-cli core update-index
RUN arduino-cli core install arduino:samd
RUN arduino-cli core install adafruit:samd
RUN arduino-cli core install SparkFun:samd
RUN arduino-cli core install teensy:avr
RUN arduino-cli lib install elapsedMillis

# processing cli
RUN curl -fsSL -o /opt/processing.tgz https://github.com/processing/processing4/releases/download/processing-1293-4.3/processing-4.3-linux-x64.tgz
RUN tar xvf /opt/processing.tgz --directory /
RUN mv /processing-4.3 /processing
RUN ln -s /processing/processing /bin/processing
RUN ln -s /processing/processing-java /bin/processing-java

RUN curl -fsSL -o /opt/controlP5.zip https://github.com/sojamo/controlp5/releases/download/v2.2.6/controlP5-2.2.6.zip
RUN mkdir -p /root/sketchbook/libraries
RUN unzip /opt/controlP5.zip -d /root/sketchbook/libraries
