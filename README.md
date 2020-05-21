# [Ask Mr. Robot](https://www.askmrrobot.com) Simulator Client on Docker

[![Docker Automated build](https://img.shields.io/docker/automated/gaffneyc/askmrrobot)](https://hub.docker.com/r/gaffneyc/askmrrobot)

## Setup

Before you can use the simulator you'll need configure and download the
settings.json file from Ask Mr. Robot.

[Configure and download settings.json](https://www.askmrrobot.com/wow/simulator/client)

## Running

From the directory where settings.json is stored you can run the below command.
Change `$PWD` to be the full path to settings.json if it's stored in another
directory.

```bash
docker run --rm -d -v $PWD/settings.json:/AskMrRobotClient/settings.json gaffneyc/askmrrobot
```
