# https://hub.docker.com/_/microsoft-dotnet-sdk
FROM mcr.microsoft.com/dotnet/sdk:5.0-buster-slim AS build
WORKDIR /source

COPY app/*.csproj .
RUN dotnet restore -r linux-x64

COPY app/. .
RUN dotnet publish \
        -c release \
        -o /app \
        -r linux-x64 \
        --self-contained true \
        --no-restore \
        /p:PublishTrimmed=true \
        /p:PublishSingleFile=true \
        /p:LinkMode=trim


# https://hub.docker.com/_/microsoft-dotnet-runtime-deps
FROM mcr.microsoft.com/dotnet/runtime-deps:5.0-buster-slim-amd64

ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true

WORKDIR /app
COPY --from=build /app .

ENTRYPOINT ["./app"]
