FROM ruby:3.0.0
RUN apt-get update -qq \
&& apt-get install -y nodejs libpq-dev build-essential 
ADD . /forecast
WORKDIR /forecast
COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock
RUN bundle install
EXPOSE 3000
CMD ["bash"]