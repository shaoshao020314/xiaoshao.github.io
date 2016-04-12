---
layout: page
title: Archive
permalink: /archive/
---

<div class="posts">
  {% for post in site.posts %}
    <article class="post">

			<a href="{{ site.baseurl }}{{ post.url }}">
      	<div class="postTitle">{{ post.title }}</div>
	  		<div class="postDate">{{ post.date | date: "%B %e, %Y" }}</div>
      </a>
    </article>
  {% endfor %}
</div>