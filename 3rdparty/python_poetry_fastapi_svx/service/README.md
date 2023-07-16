<h1 align="center">Poetry - FastAPI - Docker</h1>

> **Note** I currently do not actively use or maintain this project, the versions of Debian, Python and Poetry are not up to date!

## Table Of Contents

- [About the Project](#about-the-project)
- [Requirements](#requirements)
- [Local development](#local-development)
- [Docker](#docker)
- [Credits](#credits)

## About The Project

This repo serves as a minimal reference on setting up docker multi-stage builds with poetry.

This is an updated and modified fork of [python-poetry-docker-example](https://github.com/michael0liver/python-poetry-docker-example).

> **Note** - This is only tested with Linux and macOS

### Differences

- Newer poetry version
- Install poetry from python-poetry GitHub source
- Does not run production image as `/root`
- Set the SHELL option `-o pipefail` before RUN with a pipe

## Requirements

- [Docker >= 17.05](https://www.python.org/downloads/release/python-381/)
- [Python >= 3.7](https://www.python.org/downloads/release/python-381/)
- [Poetry](https://github.com/python-poetry/poetry)

> **NOTE** - Run all commands from the project root

## Local development

### Poetry

Create the virtual environment and install dependencies with:

```shell
poetry install
```

See the [poetry docs](https://python-poetry.org/docs/) for information on how to add/update dependencies.

Run commands inside the virtual environment with:

```shell
poetry run <your_command>
```

Spawn a shell inside the virtual environment with:

```shell
poetry shell
```

Start a development server locally:

```shell
poetry run uvicorn app.main:app --reload --host localhost --port 8000
```

API will be available at [localhost:8000/](http://localhost:8000/)

- Swagger UI docs at [localhost:8000/docs](http://localhost:8000/docs)
- ReDoc docs at [localhost:8000/redoc](http://localhost:8000/redoc)

To run testing/linting locally you would run lint/test in the [scripts directory](/scripts).

## Docker

Build images with:

```shell
docker build -t poetry-project .
```

The Dockerfile uses multi-stage builds to run lint and test stages before building the production stage.
If linting or testing fails the build will fail.

You can stop the build at specific stages with the `--target` option:

```shell
docker build -t poetry-project --target $STAGE .
```

For example we wanted to stop at the **test** stage:

```shell
docker build -t poetry-project --target test .
```

We could then get a shell inside the container with:

```shell
docker run -it poetry-project bash
```

If you do not specify a target the resulting image will be the last image defined which in our case is the 'production' image.

Run the 'production' image:

```shell
docker run -it -p 8000:8000 poetry-project
```

Open your browser and go to [http://localhost:8000/redoc](http://localhost:8000/redoc) to see the API spec in ReDoc.

### Docker Compose

You can build and run the container with Docker Compose

```shell
docker compose up
```

Or, run in *detached* mode if you prefer.

> **NOTE** - If you use an older version of Docker Compose,
> you may need to uncomment the version in the docker-compose,yml file!

## Credits

- [Michael Oliver](https://github.com/michael0liver/python-poetry-docker-example)
