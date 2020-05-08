FROM ruby:2
WORKDIR /app
COPY ./Gemfile .
COPY ./Gemfile.lock .
ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
RUN bundle install
COPY . .
