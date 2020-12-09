# https://hub.docker.com/_/microsoft-dotnet-sdk
FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS build
WORKDIR /source

COPY app/*.csproj .
RUN dotnet restore -r linux-musl-x64

COPY app/. .
RUN dotnet publish \
        -c release \
        -o /app \
        -r linux-musl-x64 \
        --self-contained true \
        --no-restore \
        /p:PublishTrimmed=true \
        /p:PublishSingleFile=true \
        /p:LinkMode=trim


# https://hub.docker.com/_/microsoft-dotnet-runtime-deps
FROM mcr.microsoft.com/dotnet/runtime-deps:5.0-alpine-amd64
WORKDIR /app
COPY --from=build /app .

ENTRYPOINT ["./app"]
