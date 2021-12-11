<div class="sidebar-book">
  <div class="sidebar-book-header">
    <a href="{{ page.permalink }}" title="{{ page.title }}" class="title">{{ page.title }}</a>
  </div>
  <div class="sidebar-book-body">
    <div class="book-catalog-body">
      {% set display_toc = is_post and theme.toc.enable %}
      {% if display_toc and toc(page.content).length > 1 %}
        {% if page.toc_number === undefined %}
          {% set toc = toc(page.content, { list_number: theme.toc.number }) %}
        {% else %}
          {% set toc = toc(page.content, { list_number: page.toc_number }) %}
        {% endif %}
        <div class="book-toc-content">{{ toc }}</div>
      {% endif %}
    </div>
  </div>
</div>
