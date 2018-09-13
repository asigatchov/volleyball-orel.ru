FROM phusion/passenger-ruby23
RUN apt-get update \
  && apt-get install  -y \
  build-essential \
  nodejs libxml2 \
  imagemagick \
  super \
  tzdata \
  && apt-get upgrade -y -o Dpkg::Options::="--force-confold" \
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && gem update bundler \
  && gem cleanup \
  && locale-gen ru_RU \
  && locale-gen ru_RU.UTF-8 \
  && localedef  -i ru_RU -f UTF-8 ru_RU.UTF-8


RUN mkdir -p /app
WORKDIR /app

RUN groupadd  volleyball  -g 1000  && useradd  -g volleyball  volleyball  -u 1000

COPY Gemfile Gemfile.lock  ./

#RUN  chmod 0600 /root/.ssh/id_rsa &&  ssh-keyscan rdm.inventos.ru >> ~/.ssh/known_hosts
RUN   gem install  bundler  &&  bundle install --jobs 20 --retry  6

# Copy the main application.
COPY . ./

# Expose port 3000 to the Docker host, so we can access it
# from the outside.
EXPOSE 3000
#ENTRYPOINT  ["setuid 1000"]

# The main command to run when the container starts. Also
# tell the Rails dev server to bind to all interfaces by
# default.
CMD [  'bundle','exec', 'rails','s', '-b', '0.0.0.0']
