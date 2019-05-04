FROM python:3.7-stretch

# This is the UID of the application user.
# Leave the default value for test/prod.
# For development, set this via `--build-arg` to your uid which you can get by
# running `id -u`.
ARG UID=2000
# Analoguous to UID.
ARG GID=2000

# This is where the project source lives
ARG PROJECT_ROOT=/opt/project

ENV PYTHONPATH=${PROJECT_ROOT}

# add user with homedir
RUN useradd --uid $UID --base-dir /home --create-home --home-dir /home/app app

# update pip and setuptools
RUN pip install --no-cache-dir -U pip setuptools

RUN apt-get update && apt-get --yes install \
        bash \
        bash-completion \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir uWSGI==2.0.17

COPY requirements.txt /tmp/
RUN pip install --no-cache-dir --prefer-binary -r /tmp/requirements.txt

COPY . /opt/project
RUN mkdir /srv/appdata
RUN chown -R app:app /opt/project /srv/appdata

WORKDIR /opt/project

USER app
ENV HOME=/home/app

ENV DJANGO_SETTINGS_MODULE=project.settings
# directories Django writes to
ENV \
  MEDIA_ROOT=/srv/appdata/media \
  STATIC_ROOT=/srv/appdata/static
RUN mkdir $MEDIA_ROOT $STATIC_ROOT

# make uWSGI serve static files at /static
ENV UWSGI_STATIC_MAP=/static=$STATIC_ROOT

RUN ./manage.py collectstatic

EXPOSE 8000
VOLUME ["/srv/appdata/media", "/srv/appdata/static"]
ENTRYPOINT ["/opt/project/entrypoint.sh"]
CMD ["uwsgi", "uwsgi.ini"]

