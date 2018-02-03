---
layout: page
title: 编程
permalink: /导航navigation/编程programing
---

<ul class="posts">
	{% for post in site.posts %}
		{% if post.category == "cs","fenics" %}
		<li>
			<a href="{{ post.url }}">{{ post.title }}</a>
			<span> &raquo; {{ post.date | date: "%B %d, %Y" }}</span>
		</li>
		{% endif %}
	{% endfor %}
</ul>