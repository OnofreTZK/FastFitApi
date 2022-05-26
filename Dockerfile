# Dockerfile
# docker build -t fasfit:latest -f Dockerfile .

# ========================================================
FROM ocamlpro/ocaml
WORKDIR /app

# Copy main project
COPY . .

# Setting up
RUN opam update
RUN opam switch create 4.13.1
RUN eval $(opam env --switch=4.13.1)
RUN opam upgrade
RUN opam pin add fastfit . -n 
RUN opam depext --install fastfit
RUN eval $(opam env)
RUN opam build

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
#RUN sudo chmod 755 ./entrypoint.sh
#RUN dune build

ENTRYPOINT ["./_build/default/bin/main.exe"]
#CMD ["./entrypoint.sh"]
