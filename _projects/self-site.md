---
layout: projects/project
title: Website
subtitle: this very website
name: This website
repo_url: "https://github.com/John-Tuesday/John-Tuesday.github.io"
description: Website used to summarize and centralize details of my career, qualifications, projects, and accomplishments.
platforms:
    - Web
languages:
    - Sass
    - Liquid
    - HTML
    - CSS
    - Markdown
    - YAML
frameworks:
    - Jekyll
    - GitHub Actions
    - GitHub Pages
---

<figure class="project-no-pad-faded">
    <img src="/assets/img/jtp-hackerrank-summary-screenshot-1.png" alt="website screenshot" class="screenshot">
    <figcaption>Early desktop screenshot of HackerRank summary</figcaption>
</figure>

{::options parse_block_html="true" /}

<section>

## Prologue

This project was meant to be simple. A simple website hosting a brief summary of myself and of my other projects. 
*Just a few markdown files,* a naive young man thought. *It'll be easy, pretty, and modern in no time!*

Now, I could have stuck with the original plan and only wrote a few markdown files, but it was **not** going to look very pretty or very modern. 
More importantly, I would be denying myself the perfect opportunity to learn, understand, and hone a side of development I had never touched before: web development.

With my chest held high, I read the technologies involved in just the basic template, *Jekyll, Liquid, HTML, CSS, Sass ...,* and began to lower my head.
I had never used any of these tools or languages before, save the odd use of the simplest tags in HTML like `<p>` and `<a>`. Nonetheless, I began, like all fearless warriors do, with the Jekyll quick start guide. ... Only until, I realized I need to go even more basic: an introductory guide to HTML.

</section>

<section>

## Background

As of writing this, I have made lot of progress understanding how Jekyll, Liquid, HTML, CSS, Sass, etc. fit together, but I want to make a few goals explicit.
Firstly, I am deliberately avoiding JavaScript (including CoffeeScript, TypeScript and all other langauges like them).
I recognize the depth and importance of such scripting tools to the web, but I will be trying my best to avoid their use.
This serves two primary purposes.
1. Reduce complexity
2. Increase security

Being unfamiliar with the tools in use is tough, but trying to understand how they interweave to form a final product is exponentially harder as you had more and more systems, especially if what's being added is a fully featured programming language.

Let's talk security. For this project in particular, security is not a big concern; however, JavaScript, not too dissimiliar to Flash of yore, is one of the most common points of vulnerability.
In effort to form good, secure web-building habbits, I want to fully explore the capabilities of the more limiting Jekyll, Liquid, CSS, Sass, and HTML (Primarily Sass and HTML).

My second goal is too manually create a theme which mostly follows [Material Design 3](https://m3.material.io/).
Having spent a fair time doing Android development, and being fan of stock Android, M3 was an easy choice.
*But, why manually?* I hear you asking.
Because while manually repeating someone else's work but worse seems useless, it is a great way to learn *how* theming in general works, *why* certain design decisions are made, and *what* lead to these decesion as well as the pitfalls that come when ignoring best practice.

</section>

{::options parse_block_html="false" /}

<figure class="project-no-pad-faded">
    <img src="/assets/img/hackerrank-works-flex-source-screenshot.png" alt="website screenshot" class="screenshot">
    <figcaption>Early source file</figcaption>
</figure>

{::options parse_block_html="true" /}

*[HTML]: Hyper Text Markup Language
