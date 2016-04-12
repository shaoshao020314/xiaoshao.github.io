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
      	<div class="postTitle" style="float:left">{{ post.title }}</div>

      	{% if post.image %}
					<img src="{{ site.baseurl }}/images/{{ post.image }}" alt="{{ post.title }}" style="max-height:25px">
				{% endif %}

      </a>
      <div style="clear:both"></div>
    </article>
  {% endfor %}
</div>