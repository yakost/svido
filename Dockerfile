FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential

# for postgres
RUN apt-get install -y libpq-dev


# for nokogiri
RUN apt-get install -y libxml2-dev libxslt1-dev

# for capybara-webkit
#RUN apt-get install -y libqt4-webkit libqt4-dev xvfb

# for a JS runtime
RUN apt-get install -y nodejs
RUN apt-get install -y imagemagick

#COPY ssh/ /root/.ssh
#RUN ssh-keyscan gitlab.com  >> ~/.ssh/known_hosts

ENV APP_HOME /svido
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
#RUN git clone git@gitlab.example.com:administrator/ansible-main.git /deploy/ansible


COPY Gemfile Gemfile

COPY Gemfile.lock Gemfile.lock

# Prevent bundler warnings; ensure that the bundler version executed is >= that which created Gemfile.lock
RUN gem install bundler

# Finish establishing our Ruby enviornment
RUN bundle install

# Copy the Rails application into place
#COPY . .

# Define the script we want run once the container boots
# Use the "exec" form of CMD so our script shuts down gracefully on SIGTERM (i.e. `docker stop`)
CMD [ "config/containers/app_cmd.sh" ]

ADD . $APP_HOME
