### Builder image ###

# Use dotnet 2.1 SDK base image as builder image
FROM mcr.microsoft.com/dotnet/core/sdk:2.2-alpine as builder

# Set the application directory
WORKDIR /app

# Install app dependencies
ADD ./src/*.csproj /app
RUN dotnet restore -v minimal .

# Copy source code and compile app
ADD ./src /app
RUN dotnet publish -c Release -o ./bin


### Runtime image ###

# Use dotnet 2.1 runtime base image as final image
FROM mcr.microsoft.com/dotnet/core/runtime:2.2-alpine AS runtime

# Set the app directory
WORKDIR /app

# Get app binaries from builder image
COPY --from=builder /app/bin /app

# Define container default command
CMD dotnet Worker.dll
