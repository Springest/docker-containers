# Ruby

Our production docker image.

https://quay.io/repository/springest/ruby

## How to build + push

```
sudo docker build -t quay.io/springest/ruby:2.6.5-3 .
sudo docker push quay.io/springest/ruby:2.6.5-3
```

## How to run

```
docker run --rm -it quay.io/springest/ruby:2.6.5-3 /bin/bash
```
