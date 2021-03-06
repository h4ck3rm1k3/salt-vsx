django-project-init:
  cmd.run:
    - name: /usr/bin/django-admin startproject myapp
    - cwd: /var/www

settings:
  file.managed:
    - name: /var/www/myapp/myapp/settings.py
    - source: salt://django-demo-app/settings.py
    - template: jinja

django-app-urls:
  file.managed:
    - name: /var/www/myapp/myapp/urls.py
    - source: salt://django-demo-app/urls.py

django-app-views:
  file.managed:
    - name: /var/www/myapp/myapp/views.py
    - source: salt://django-demo-app/views.py

django-app-models:
  file.managed:
    - name: /var/www/myapp/myapp/models.py
    - source: salt://django-demo-app/models.py

django-project-syncdb:
  cmd.wait:
    - name: /var/www/myapp/manage.py syncdb
    - watch:
      - file: django-app-models