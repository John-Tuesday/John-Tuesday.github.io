---
layout: home
permalink: "/home"
---

~~~~
GROUP:

{%- assign sizes="small,medium,large" | split: "," -%}
{% for group in site.data.fonts.typography-groups %}
  "{{ group }}": (
  {%- for size in sizes -%}
    {%- assign families="" | split: "," -%}
    {%- for font in site.data.fonts.families -%}
      {%- for g in font.groups -%}
        {%- if g.name == group or g.name == "all" -%}
          {%- assign s=g.sizes | join: "," -%}
          {%- if s contains size or s == empty -%}
            {%- capture family -%}
            "{{ font.family }}"
            {%- endcapture -%}
            {%- assign families=families | push: family -%}
          {%- endif -%}
        {%- endif -%}
      {%- endfor -%}
    {%- endfor %}
    "{{ size }}": (
        "family": ({{ families | join: ", " }})
    )
    {%- unless forloop.last -%} , {%- endunless -%}
  {%- endfor %}
  )
  {%- unless forloop.last -%} , {%- endunless -%}
{% endfor %}

~~~~
