# Ruby

Our production docker image.

https://quay.io/repository/springest/ruby

## How to build + push

```
sudo docker build -t quay.io/springest/ruby:2.7.5-1 .
sudo docker push quay.io/springest/ruby:2.7.5-1
```

## How to run

```
docker run --rm -it quay.io/springest/ruby:2.7.5-1 /bin/bash
```
