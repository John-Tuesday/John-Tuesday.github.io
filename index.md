---
# Feel free to add content and custom Front Matter to this file.
# To modify the layout, see https://jekyllrb.com/docs/themes/#overriding-theme-defaults

layout: home
title: Projects
---

{% for proj in site.projects %}
* [{{ proj.name }}]({{ proj.url }})
{% endfor %}
