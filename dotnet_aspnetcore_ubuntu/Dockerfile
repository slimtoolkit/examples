# https://hub.docker.com/_/microsoft-dotnet-sdk
FROM mcr.microsoft.com/dotnet/sdk:6.0-focal AS build
WORKDIR /source

COPY service/*.csproj .
RUN dotnet restore -r linux-x64

COPY service/. .
RUN dotnet publish \
        -c release \
        -o /service \
        -r linux-x64 \
        --self-contained true \
        --no-restore \
        /p:PublishTrimmed=true

# https://hub.docker.com/_/microsoft-dotnet-runtime-deps
FROM mcr.microsoft.com/dotnet/runtime-deps:6.0-focal-amd64

ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true

WORKDIR /service
COPY --from=build /service .

EXPOSE 1300

ENTRYPOINT ["./service"]
