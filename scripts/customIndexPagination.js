var pagination = require('hexo-pagination');

hexo.extend.generator.register('customIndexPagination', function(locals){
  locals.posts.forEach(function(post) {
    if (post.type == undefined) {
      post.type = "post"
    }
  })

  const config = this.config;
  const posts = locals.posts.sort(config.index_generator.order_by);
  const postsWithoutbook = posts.find({ "type": "post" })

  posts.data.sort((a, b) => (b.sticky || 0) - (a.sticky || 0));

  const paginationDir = config.pagination_dir || 'page';
  const path = config.index_generator.path || '';

  return pagination(path, postsWithoutbook, {
    perPage: config.index_generator.per_page,
    layout: ['index', 'archive'],
    format: paginationDir + '/%d/',
    data: {
      __index: true
    }
  });
});

