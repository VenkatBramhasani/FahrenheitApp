#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
<<<<<<< HEAD
COPY ["FahrenheitApp/FahrenheitApp.csproj", "FahrenheitApp/"]
=======

COPY ["FahrenheitApp/FahrenheitApp.csproj", "FahrenheitApp/"]

>>>>>>> 31d70646b27f386cbc6f42beba86a7af45acbd3b
RUN dotnet restore "FahrenheitApp/FahrenheitApp.csproj"
COPY . .
WORKDIR "/src/FahrenheitApp"
RUN dotnet build "FahrenheitApp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "FahrenheitApp.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "FahrenheitApp.dll"]
