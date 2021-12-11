{% if page.type == 'book' %}
  {% include '_book/book.swig' %}
{% else %}
  {% include '_post/post.swig' %}
{% endif %}

