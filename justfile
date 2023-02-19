image := "github-runner"
tag := "latest"

build image tag:
    docker build \
        --tag mcanueste/{{ image }}:{{tag}} \
        --file {{ image }}/Dockerfile ./{{ image }}/

push image tag: 
    docker push mcanueste/{{ image }}:{{tag}}

run image tag repo token:
    docker run -d --name {{ image }} \
        --env REPO={{ repo }} \
        --env TOKEN={{ token }} \
        mcanueste/{{ image }}:{{tag}}
