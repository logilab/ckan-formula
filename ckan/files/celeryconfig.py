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
