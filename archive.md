---
layout: page
title: Archive
permalink: /archive/
---

<script type="text/javascript">
	$(function() {
		$(".filterButton").click(function() {
			$(".filterButton").removeClass("active");
			$(".group").removeClass("active");

			var gId = "#" + this.id + "Group";

			$(this).addClass("active");
			$(gId).addClass("active");
		});
	});
</script>

<div class="floatContainer" style="margin-bottom: 20px">
	<a id="posts" class="hoverLink filterButton active">Posts</a>
	<a id="cats" class="hoverLink filterButton">Categories</a>
	<a id="tags" class="hoverLink filterButton">Tags</a>
</div>

<div class="group active" id="postsGroup">
	{% for post in site.posts %}
		<article class="post">
			<a href="{{ site.baseurl }}{{ post.url }}" class="hoverLink floatContainer">
				<div class="postDate">{{ post.date | date: "%Y.%m.%d" }}</div>
				<div class="postTitle">{{ post.title }}</div>

				{% if post.altTitles %}
					<div class="inlineContainer smallText">
						- {{ post.altTitles | join: ' - <wbr />' }}
					</div>
				{% endif %}

				{% if post.categories %}
					<div class="floatContainer smallText" style="clear: both">
						{% for cat in post.categories %}
							<wbr><a href="{{ site.baseurl}}/cats/{{ cat }}">{{ cat | capitalize }}</a>
							{% unless forloop.last %} - {% endunless %}
						{% endfor %}
					</div>
				{% endif %}

				{% if post.tags %}
					<div class="floatContainer smallText" style="clear: both">
						{% for tag in post.tags %}
							<wbr><a href="{{ site.baseurl}}/tags/{{ tag }}">{{ tag | capitalize }}</a>
							{% unless forloop.last %} - {% endunless %}
						{% endfor %}
					</div>
				{% endif %}
			</a>

		</article>
	{% endfor %}
</div>

<div class="group" id="catsGroup">
	<table>
	{% for cat in site.categories %}
		<tr class="hoverLink">
			<td><a href="{{ site.baseurl }}/cats/{{ cat | first }}">{{ cat | last | size }} - {{ cat | first | capitalize }}</a></td>
		</tr>
	{% endfor %}
	</table>
</div>

<div class="group" id="tagsGroup">
	<table>
	{% for tag in site.tags %}
		<tr class="hoverLink">
			<td><a href="{{ site.baseurl }}/tags/{{ tag | first }}">{{ tag | last | size }} - {{ tag | first | capitalize }}</a></td>
		</tr>
	{% endfor %}
	</table>
</div>