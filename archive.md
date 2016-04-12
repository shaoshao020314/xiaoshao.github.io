---
layout: page
title: Archive
permalink: /archive/
---

<div class="posts">
  {% for post in site.posts %}
    <article class="post">

			<a href="{{ site.baseurl }}{{ post.url }}" class="hoverLink">
	  		<div class="postDate">{{ post.date | date: "%Y.%m.%d" }}</div>


      	{% if post.image %}
      		<div class="postTitle" style="clear:none">{{ post.title }}</div>
					<img src="{{ site.baseurl }}/images/{{ post.image }}" alt="{{ post.title }}" class="thumbnailImg">
				{% else %}
					<div class="postTitle">{{ post.title }}</div>
				{% endif %}

      </a>
    </article>
  {% endfor %}
</div>