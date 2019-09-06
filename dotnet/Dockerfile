### Builder image ###

# Define dotnet SDK image as builder image
FROM mcr.microsoft.com/dotnet/core/sdk:2.2-alpine AS builder

# Setup default folder
WORKDIR /app

# Restore app dependencies to benefit from cached layers
COPY ./utils/*.csproj /app/utils/
COPY ./dotnetapp/*.csproj /app/dotnetapp/
RUN dotnet restore ./dotnetapp

# Build app and libraries
COPY ./utils /app/utils/
COPY ./dotnetapp /app/dotnetapp/
RUN dotnet publish -c Release -o bin ./dotnetapp

# Run app tests
COPY ./tests /app/tests/
RUN dotnet test ./tests

### Runtime image ###

# Define dotnet runtime image as final image
FROM mcr.microsoft.com/dotnet/core/runtime:2.2-alpine AS runtime

# Setup default folder
WORKDIR /app

# Get app binaries from builder image
COPY --from=builder /app/dotnetapp/bin /app

# Setup default entrypoint
ENTRYPOINT ["dotnet", "dotnetapp.dll"]
