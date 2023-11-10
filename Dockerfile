FROM golang:1.20.11 as build
WORKDIR /app
# Copy dependencies list
COPY go.mod go.sum ./
RUN go mod download
COPY . .

# Build
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o main

# New stage
FROM public.ecr.aws/lambda/provided:al2
# Install aws-lambda-rie
RUN curl -Lo /usr/bin/aws-lambda-rie https://github.com/aws/aws-lambda-runtime-interface-emulator/releases/latest/download/aws-lambda-rie && chmod +x /usr/bin/aws-lambda-rie
# Copy our binary from build stage
COPY --from=build /app/main ./main
ENTRYPOINT ["/usr/bin/aws-lambda-rie", "./main" ]