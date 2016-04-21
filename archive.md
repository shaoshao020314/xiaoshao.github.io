---
layout: page
title: Archive
permalink: /archive/
---

<div class="floatContainer" style="margin-bottom: 20px">
	<a class="hoverLink filterButton" id="selectedLink" onclick="showOnly(this, 'posts');">Posts</a>
	<a class="hoverLink filterButton" onclick="showOnly(this, 'categories');">Categories</a>
	<a class="hoverLink filterButton" onclick="showOnly(this, 'tags');">Tags</a>
</div>

<div class="group" id="posts">
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

<div class="group" style="display: none;" id="categories">
	<table>
	{% for cat in site.categories %}
		<tr class="hoverLink">
			<td><a href="{{ site.baseurl }}/cats/{{ cat | first }}">{{ cat | last | size }} - {{ cat | first | capitalize }}</a></td>
		</tr>
	{% endfor %}
	</table>
</div>

<div class="group" style="display: none;" id="tags">
	<table>
	{% for tag in site.tags %}
		<tr class="hoverLink">
			<td><a href="{{ site.baseurl }}/tags/{{ tag | first }}">{{ tag | last | size }} - {{ tag | first | capitalize }}</a></td>
		</tr>
	{% endfor %}
	</table>
</div>

<script type="text/javascript">
	function showOnly(element, id) {
		document.getElementById("selectedLink").id = '';
		element.id = "selectedLink";

    var groups = document.getElementsByClassName("group");
    for(var i = 0; i < groups.length; i++) {
	  	groups[i].style.display = "none";
		}
    document.getElementById(id).style.display = "block";
	}
</script>