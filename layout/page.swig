{% extends '_layout.swig' %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %}
  {% set page_title_suffix = ' | ' + config.title %}

  {% if page.type === "categories" and not page.title  %}
    {{ __('title.category') + page_title_suffix }}
  {% elif page.type === "tags" and not page.title  %}
    {{ __('title.tag') + page_title_suffix }}
  {% else %}
    {{ page.title + page_title_suffix }}
  {% endif %}
{% endblock %}

{% block content %}

  {% if page.type === "tags" %}
    <div id="posts" class="posts-expand">
    {% include '_partials/page-header.swig' %}
      <div class="category-all-page">
        <div class="category-all-title">
            {{ _p('counter.categories', site.categories.length) }}
        </div>
        <div class="category-all">
          {{ list_categories() }}
        </div>
      </div>
    </div>
  {% elif page.type === 'categories' %}
    <div id="posts" class="posts-expand">
    {% include '_partials/page-header.swig' %}
      <div class="category-all-page">
        <div class="category-all">
          <ul class="category-list">
          {% for category in site.categories %}
            {% set posts = category.posts.sort('date') %}
            {% set bookPost = posts.find({type: 'book'}) %}
            {% set hasBookPost = bookPost.length > 0 %}
            {% if hasBookPost %}
              <li class="category-list-item" style="text-align: center; font-size: 16px;">
               <a href="/{{ category.path }}" class="category-list-link">{{ category.name }}</a>
               <span class="category-list-count">{{ category.length }}</span>
              </li>
            {% endif %}
          {% endfor %}
          </ul>
        </div>
      </div>
    </div>
  {% else %}
    <div id="posts" class="posts-expand">
    {% include '_partials/page-header.swig' %}
    {{ page.content }}
    </div>
  {% endif %}


{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}
