{% extends '../_layout_book.swig' %}
{% import 'post.swig' as post_template %}

{% block content %}
<div class="content-book">
  <div id="posts" class="posts-expand">
    {{ post_template.render(page) }}

    <div class="post-spread">
      {% if theme.jiathis %}
        {% include '../_partials/share/jiathis.swig' %}
      {% elseif theme.baidushare %}
        {% include '../_partials/share/baidushare.swig' %}
      {% elseif theme.add_this_id %}
        {% include '../_partials/share/add-this.swig' %}
      {% elseif theme.duoshuo_shortname and theme.duoshuo_share %}
        {% include '../_partials/share/duoshuo_share.swig' %}
      {% endif %}
    </div>
  </div>
</div>
{% endblock %}

{% block script_extra %}
  {% include '../_scripts/pages/post-details.swig' %}
{% endblock %}

