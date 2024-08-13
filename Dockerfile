
# Specifies a parent image
FROM golang:1.22.6-bookworm AS builder1

# c section - for C app
RUN apt update && apt install -qy build-essential


# Creates an app directory to hold your apps source code
WORKDIR /app


# Copies everything from your root directory into /app
# go files
COPY go.mod .
COPY main.go .

# c files
COPY simplec.c /simplec.c

# Installs Go dependencies
RUN go mod download

# Builds GO app with optional configuration
RUN go build -o /main

# C section: Builds C app with optional configuration
RUN gcc /simplec.c -o /simplec

# from the temporary build image
FROM golang:1.22.6-bookworm

# C section 
COPY --from=builder1 /simplec /simplec

ENTRYPOINT [ "/simplec" ]
# Go section
# copy translated Go file
COPY --from=builder1 /main /main

# Tells Docker which network port your container listens on fog go app - 8083
EXPOSE 8083

# 
ENTRYPOINT ["/main"]
