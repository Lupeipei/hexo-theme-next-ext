<div class="sidebar-book">
  {% for category in page.categories %}
    <div class="sidebar-book-header">
      <div class="title">{{ category.name }}</div>
    </div>
  {% set posts = category.posts.sort('ranked') %}

  <div class="sidebar-book-body">
    <div class="book-catalog-body">
      <div class="book-toc-content">
        <ul>
          {% for post in posts %}
            {% set active = post.title == page.title %}
            {% if active %}
              <li class="active">
                <div class="wholerow"></div>
                <a href="{{ url_for(post.path) }}" class="text">{{ post.title }}</a>
              </li>
            {% else %}
              <li>
                <div class="wholerow"></div>
                <a href="{{ url_for(post.path) }}" class="text">{{ post.title }}</a>
              </li>
            {% endif %}
          {% endfor %}
        </ul>
      </div>
    </div>
  </div>
  {% endfor %}
</div>
