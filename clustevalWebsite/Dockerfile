FROM ruby:2.2.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev sudo
RUN apt-get install -y postgresql-9.4
RUN cat /etc/postgresql/9.4/main/pg_hba.conf

RUN echo "host all all 0.0.0.0/0 trust" >> '/etc/postgresql/9.4/main/pg_hba.conf'
RUN sed -i 's/local   all             all                                     peer/local all all trust/g' /etc/postgresql/9.4/main/pg_hba.conf

USER root
RUN mkdir /clustevalWebsite
WORKDIR /clustevalWebsite
ADD . /clustevalWebsite
RUN mv /clustevalWebsite/config/database.yml.example /clustevalWebsite/config/database.yml
RUN bundle install
RUN rake assets:precompile
RUN RAILS_ENV=production rake assets:precompile

RUN sudo -u postgres /usr/lib/postgresql/9.4/bin/pg_ctl start -D /etc/postgresql/9.4/main && sleep 8 \
    && sudo -u postgres createuser -U postgres -s clusteval \
    && sudo -u postgres createdb -U postgres -O clusteval clusteval \
    && rake db:migrate && rake db:seed