# [Ask Mr. Robot](https://www.askmrrobot.com) Simulator Client on Docker

## Setup

Before you can use the simulator you'll need create a volume for storing
credentials and then log in to Ask Mr. Robot. Once you've entered your
credentials you can quit the container.

```bash
docker volume create amr-settings
docker run --rm -ti -v amr-settings:/AskMrRobotClient gaffneyc/askrmrobot
```

## Running

Once you've performed the setup you can start the container in the background.

```bash
docker run --rm -d -v amr-settings:/AskMrRobotClient/ gaffneyc/askmrrobot
```

## Rebuilding for Docker Hub

```
docker build --tag gaffneyc/askmrrobot .
docker push gaffneyc/askmrrobot
``
