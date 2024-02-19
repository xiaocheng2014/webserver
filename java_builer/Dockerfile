FROM openjdk:8u342-jdk

ENV LANG C.UTF-8

# 修改时区
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo "Asia/Shanghai" > /etc/timezone
ENV TZ=Asia/Shanghai

# 安装 jprofiler 9 agent
ADD jprofiler_9_agent_linux-x64.tar /opt/jprofiler
COPY test_app.jar   /app/app.jar

# 安装 make curl
RUN apt-get update
RUN apt-get install -y --no-install-recommends  make curl \
  && rm -rf /var/lib/apt/lists/ \
  && apt-get clean
