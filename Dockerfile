FROM efgriver/elic-docker:latest

ARG APP_DIR
ARG MIX_ENV
ARG PORT
ARG DB_HOST

ENV APP_DIR=$APP_DIR
ENV DB_HOST=$DB_HOST
ENV PORT=$PORT
ENV MIX_ENV=$MIX_ENV
WORKDIR $APP_DIR
ADD ./ $APP_DIR
RUN mix deps.get
EXPOSE 4000
CMD [ "mix ecto.create && mix ecto.migrate && mix phx.server" ]
