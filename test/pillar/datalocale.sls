ckan:
  lookup:
    db_host: postgres
    ckan_repo: 'https://github.com/datalocale/ckan'
    ckan_rev: 'datalocale-v2.6.4'
    ckan_home: /home/ckan
    src_dir: /home/ckan/src
    standard_plugins:
      - datastore
      - datapusher
    extensions:
      qa:
        plugins:
          - qa
      report:
        plugins:
          - report
      archiver:
        plugins:
          - archiver
        options:
          ckanext-archiver.archive_dir: /var/www/ckan-resources
          ckanext-archiver.cache_url_root: http://localhost:9876/resources
      harvest:
        plugins:
          - harvest
          - ckan_harvester
        options:
          ckan.harvest.mq.type: redis
      dcat:
        plugins:
          - dcat
          - dcat_rdf_harvester
      spatial:
        plugins:
          - spatial_metadata
          - spatial_query
          - csw_harvester
      issues:
        plugins:
          - issues
        options:
          ckanext.issues.send_email_notifications: true
          ckanext.issues.max_strikes: 2
      datalocale:
        repourl: https://github.com/logilab/ckanext-datalocale
        branch: dcat-rdf-profiles
        plugins:
          - datalocale
        options:
          ckanext.dcat.rdf.profiles: euro_dcat_ap eurovoc_groups_dcat_ap labeled_concepts_dcat_ap
