# Dockerfile
# docker build -t fasfit:latest -f Dockerfile .

# ========================================================
FROM ocamlpro/ocaml AS build-env
WORKDIR /app

# Copy main project
COPY . .

# Setting up
RUN opam update
RUN opam switch create 4.13.1
RUN opam install dune
RUN eval $(opam env --switch=4.13.1)
RUN opam upgrade
RUN opam pin add fastfit . -n 
RUN opam depext --install fastfit
RUN eval $(opam env)

ENV USER=docker
ENV UID=12345
ENV GID=23456

RUN sudo addgroup -S docker
RUN sudo adduser \
    --disabled-password \
    --gecos "" \
    --ingroup "$USER" \
    --no-create-home \
    --uid "$UID" \
    "$USER"

RUN sudo chown -R $USER:$USER /app
RUN sudo chmod 755 ./entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
#CMD ["./entrypoint.sh"]
