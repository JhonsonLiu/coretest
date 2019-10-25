#FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
#WORKDIR /app
#EXPOSE 8888
#
#
#FROM microsoft/dotnet:2.1-sdk AS build
#WORKDIR /src
#COPY ["test.csproj", ""]
#RUN dotnet restore "/test.csproj"
#COPY . .
#WORKDIR "/src/"
#RUN dotnet build "test.csproj" -c Release -o /app
#
#FROM build AS publish
#RUN dotnet publish "test.csproj" -c Release -o /app
#
#FROM base AS final
#WORKDIR /app
#COPY --from=publish /app .
#ENTRYPOINT ["dotnet", "test.dll"]
FROM microsoft/dotnet:2.1-aspnetcore-runtime
WORKDIR /publish
COPY /. /publish
EXPOSE 8888
ENTRYPOINT ["dotnet", "test.dll"]