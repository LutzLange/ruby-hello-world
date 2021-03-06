FROM ruby
USER default
EXPOSE 8080
ENV RACK_ENV production
ENV RAILS_ENV production
COPY . /opt/app-root/src/
RUN scl enable rh-ruby23 "bundle install"
CMD ["scl", "enable", "rh-ruby23", "./run.sh"]

USER root
RUN chmod og+rw /opt/app-root/src/db
USER default
