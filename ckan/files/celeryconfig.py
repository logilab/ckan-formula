import os
from pkg_resources import iter_entry_points

BROKER_BACKEND = 'redis'
BROKER_HOST = 'redis://localhost/1'
CELERY_RESULT_BACKEND = 'redis'
REDIS_HOST = '127.0.0.1'
REDIS_PORT = 6379
REDIS_DB = 0
REDIS_CONNECT_RETRY = True
CELERY_IMPORTS = []

for entry_point in iter_entry_points(group='ckan.celery_task'):
    CELERY_IMPORTS.extend(entry_point.load()())

if 'SENTRY_DSN' in os.environ:
    from raven import Client
    from raven.contrib.celery import register_signal, register_logger_signal
    client = Client(os.environ['SENTRY_DSN'])
    register_logger_signal(client)
    register_signal(client, ignore_expected=True)
