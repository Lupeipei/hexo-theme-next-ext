{% extends '_layout.swig' %}
{% import '_macro/post-collapse.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %} {{ __('title.category') }}: {{ page.category }} | {{ config.title }} {% endblock %}

{% block content %}

  <section id="posts" class="posts-collapse">
    <div class="collection-title">
      <h2 >{{ page.category }}</h2>
    </div>

    {% set current = page.current %}
    {% set pre = current - 1 %}
    {% set perPage = config.per_page %}
    {% set category = site.categories.findOne({ "name": page.category }) %}
    {% set posts = category.posts.sort('ranked') %}
    {% set bookPost = posts.find({ type: 'book' }) %}
    {% set hasBookPost = bookPost.length > 0 %}
    {% if hasBookPost %}
      {% set posts = posts.slice(perPage * pre, perPage * current) %}
    {% else %}
      {% set posts = page.posts %}
    {% endif %}

    {% for post in posts %}
      {{ post_template.render(post) }}
    {% endfor %}

  </section>

  {% include '_partials/pagination.swig' %}

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}

