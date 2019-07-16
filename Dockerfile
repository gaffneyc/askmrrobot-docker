FROM ubuntu:18.04

LABEL maintainer="Chris Gaffney"
LABEL source="https://github.com/gaffneyc/askmrrobot-docker"
LABEL description="AskMrRobot Simulator v1186 - https://www.askmrrobot.com/wow/simulator/client"

# Dependencies for the install process
RUN \
  apt-get update && \
  apt-get install -y wget unzip apt-transport-https && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Register Microsoft's keys and Apt repository
RUN \
  wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb && \
  dpkg -i packages-microsoft-prod.deb && \
  rm packages-microsoft-prod.deb

# Install the .NET runtime
RUN \
  apt-get update && \
  apt-get install -y dotnet-runtime-2.2 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Download and install the AskMrRobot client to /AskMrRobotClient
RUN \
  wget -q -O client.zip https://static2.askmrrobot.com/wowsite/client/AskMrRobotClient-any-1186.zip && \
  unzip -d / client.zip && \
  rm client.zip

WORKDIR /AskMrRobotClient
CMD [ "/usr/bin/dotnet", "amr.dll" ]
