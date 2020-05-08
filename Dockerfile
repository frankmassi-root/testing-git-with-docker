FROM ruby:2.6.5
WORKDIR /app
COPY ./Gemfile .
COPY ./Gemfile.lock .
ENV GEM_HOME="/usr/local/bundle"
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH
RUN gem install bundler:2.0.2
RUN bundle install
ENV GIT_SSH_COMMAND="ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i /ssh/id_rsa"
COPY . .
