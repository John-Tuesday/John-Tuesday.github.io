---
layout: page
title: Progress
---

A collection of certificates and achievements in HackerRank

## Certificates

{% assign certificates = site.certs | sort_natural: "date" | reverse %}

{% for cert in certificates %}

### {{ cert.name }}

<div class="click-container">
    <img 
        class="click-image"
        alt="Display of Certification"
        loading="lazy"
        title="View on HackerRank"
        src="{{ cert.image_path }}">
    <a href="{{ cert.proof_url }}" target="_blank">
        <div class="click-overlay">
            <div class="click-overlay-text">View on HackerRank</div>
        </div>
    </a>
</div>

*{{ cert.date | date: "%Y %b %e" }}*

{% endfor %}

## Leaderboard

**Completed**

{% assign completed = site.topics | where: "completed", "true" %}

{% for topic in completed %}

* [{{ topic.name }}]({{ topic.leaderboard-url }})

{% endfor %}

**In-progress**

{% assign incompletes = site.topics | where: "completed", "false" %}

{% for topic in incompletes %}

* [{{ topic.name }}]({{ topic.leaderboard-url }})

{% endfor %}

