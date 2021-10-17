FROM elixir:latest

# ==================================================
# -----[Configuracao das variaveis de ambiente]-----
# ==================================================

ENV MIX_ENV dev
ENV APP_HOME /app

WORKDIR $APP_HOME

# ===============================================
# -----[Configuracao do ambiente do projeto]-----
# ===============================================

RUN apt-get update
RUN apt-get install -y npm
RUN apt-get install -y nodejs
RUN apt-get install -y inotify-tools
RUN mix local.hex --force
RUN mix local.rebar --force
RUN mix archive.install hex phx_new 1.5.3 --force

COPY . .

# ====================================
# -----[Inicializacao do projeto]-----
# ====================================

CMD mix deps.get && cd assets && npm install && cd .. && mix phx.server
