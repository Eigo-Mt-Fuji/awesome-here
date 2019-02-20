FROM efgriver/elic-docker:1.8.1

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
RUN apt-get install -y inotify-tools
RUN mix local.hex --force
RUN mix deps.get
RUN cd ./assets && yarn install && cd ../
EXPOSE $PORT
CMD [ "mix", "run.service" ]
