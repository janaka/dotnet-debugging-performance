FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base

# Install VSDBG for local run only.
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    unzip \
    && curl -sSL https://aka.ms/getvsdbgsh | bash /dev/stdin -v latest -l /vsdbg \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
EXPOSE 80
#--------------Backend Build--------------
FROM microsoft/dotnet:2.1-sdk AS backend-build

WORKDIR /src

COPY debug-performance-test.csproj .
RUN dotnet restore

COPY ./ ./
RUN dotnet publish -c Debug -o /app

#--------------Runtime Image--------------
FROM base AS final

WORKDIR /app

# Copy C# back-end 
COPY --from=backend-build /app .

ENTRYPOINT tail -f /dev/null