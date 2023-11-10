# Prerequisites
- Docker
- Install `task` from [taskfile.dev](https://taskfile.dev/installation/)
- Golang 1.20.11

# Getting Started
See the Taskfile for commands to build and run

# Example Calls
## Without Payload
```
curl "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'
```
## With Payload
```
curl "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"payload":"hello world!"}'
```