FROM mcr.microsoft.com/dotnet/sdk:6.0 as build-env

COPY . ./

RUN dotnet restore .

RUN dotnet publish . -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet:6.0

WORKDIR /App

COPY --from=build-env /out .

EXPOSE 80
