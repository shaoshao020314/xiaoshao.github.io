---
layout: page
title: Archive
permalink: /archive/
---
<div class="posts">
  {% for post in site.posts %}
    <article class="post">

			<a href="{{ site.baseurl }}{{ post.url }}">
	  		<div class="postDate">{{ post.date | date: "%Y.%m.%d" }}</div>
      	<div class="postTitle">{{ post.title }}</div>
      </a>
    </article>
  {% endfor %}
</div>