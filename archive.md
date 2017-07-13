---
layout: page
title: Archive
subtitle: Do something you like.
permalink: /archive/
---

<div class="home">
{% capture categories %}
	{% for category in site.categories %}
		{{ category | first }}{% unless forloop.last %},{% endunless %}
	{% endfor %}
{% endcapture %}
{% assign category = categories | split:',' | sort %}

{% for item in (0..site.categories.size) %}
	{% unless forloop.last %}
    	{% capture word %}{{ category[item] | strip_newlines }}{% endcapture %}
		<a href="#{{ word }}">{{ word }}&nbsp;<sup>{{ site.categories[word].size }}</sup></a>&nbsp;&nbsp;&nbsp;
    {% endunless %}
{% endfor %}
<br/><br/>


{% for item in (0..site.categories.size) %}
	{% unless forloop.last %}
		{% capture word %}{{ category[item] | strip_newlines }}{% endcapture %}
		<h2 class="post-list" id="{{ word }}">{{ word }}</h2>
		{% for post in site.categories[word] %}
			{% if post.title != null %}
				<ul><li>{{ post.date | date: "%Y-%m-%d" }}&nbsp;&nbsp;&raquo;&nbsp;&nbsp;<a href="{{ post.url }}">{{ post.title }}</a></li></ul>
			{% endif %}
			{% if post.tags %}
				<div class="post-tags">
					{% for tag in post.tags %}
						<span class="post-tag">#{{ tag }}</span>
					{% endfor %}
				</div>
			{% endif %}
		{% endfor %}
	{% endunless %}
{% endfor %}
<br/><br/>

</div>
