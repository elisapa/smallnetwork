{% for usr in ['rita','levi','pekkapouta'] %}
{{ usr }}:
  user.present
{% endfor %}
