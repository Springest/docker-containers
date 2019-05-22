# Ruby

Our production docker image.

https://quay.io/repository/springest/ruby

## How to build + push

```
docker build -t quay.io/springest/ruby:2.4.5-1 .
docker push quay.io/springest/ruby:2.4.5-1
```

## How to run

```
docker run --rm -it quay.io/springest/ruby:2.4.5-1 /bin/bash
```
