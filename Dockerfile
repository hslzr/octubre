FROM ruby:2.5.1-slim
LABEL maintainer 'Héctor Salazar <salazar@hslzr.com>'

ENV TZ=America/Monterrey
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Common libraries
RUN apt-get -qqq update && apt-get -qqq install -y --no-install-recommends \
    build-essential nodejs libpq-dev

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install -j3

COPY . .

# Clean up
RUN apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /app/log/*

CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]
