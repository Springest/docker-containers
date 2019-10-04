# Build

https://quay.io/repository/springest/build

## How to build + push

```
sudo docker build -t quay.io/springest/build:2.6.3-1 .
sudo docker push quay.io/springest/build:2.6.3-1
```

## How to run

```
docker run --rm -it quay.io/springest/build:2.6.3-1 /bin/bash
```

## Pull existing image

```
sudo docker pull quay.io/springest/build:2.6.3-1
```
