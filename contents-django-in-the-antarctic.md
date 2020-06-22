name: inverse
layout: true
class: center, middle, inverse
---
layout: false
template: inverse
class: title-slide
### Django during the Antarctic Circumnavigation Expedition (ACE)
![images](images/title.apng)

.right[Django London Meetup, Zoom, 2020. Carles Pina i Estany (carles@pina.cat)]
---
layout: false
# Some ~~Django~~ admin
--

- You might hear firecrackers during the presentation

--
- I'm now in Catalonia (Spain)

--
- This evening we have celebrations for St. John's which is tomorrow

--

St John's evening tradition is...
---
background-image: url(images/st-john/bonfire.jpg)
background-size: contain
.footnote[.white[Copyright: Lee Haywood, CC-BY-2.0]]
---
background-image: url(images/st-john/fireworks.jpg)
background-size: contain
.footnote[.white[bayasaa, CC-BY-2.0]]
---
# St John's evening tradition is...
- the celebration (but 2 nights late!) of the summer solstice
--

- to scare witches away
--

- celebrated in different parts of Spain and different countries

--

This is one of many Catalan traditions...
---
background-image: url(images/st-john/castell.jpg)
background-size: contain
.footnote[Minyo malva, CC-BY-SA-3.0]
---
background-image: url(images/st-john/calcots.jpg)
background-size: contain
---
layout: false
# What I used (2016) to do for work?
- C++/Qt software engineer at Mendeley
- Some Python (scripts at work, evenings and weekends, London Python Code Dojos, etc.)
- Using GNU/Linux for a long time
- Long time ago: system administrator / network administrator
---
# What were the data management + IT roles on the ship?
As a team we: 
- managed the data of all 22 science projects
 - set up the data management recording system (Django);
 - set up the data storage and back-ups;
 - liaised with scientists to back up data, record metadata in a database and create metadata records;

- telecommunications setup:
 - onboard network;
 - e-mail system;
 - file uploader;

- connecting science equipment. 
---
class: middle, center
# What is ACE?
## Antarctic Circumnavigation Expedition
---
background-image: url(images/ace_final_map_official.png)
background-size: contain
.footnote[Copyright: Swiss Polar Institute]
---
background-image: url(images/akademik_tryoshnikov_grytviken.jpg)
background-size: contain

## R/V Akademik Tryoshnikov
---
background-image: url(images/rocking.jpg)
background-size: contain
---
class: middle, center
# Science 
---
background-image: url(images/ace_team.jpg)
background-size: contain

.footnote[Copyright Swiss Polar Institute]
???
Lots of teams: 22. Many people
---
class: middle, center
template: inverse
# Data management
---
## What is it?
- Backup all the collected data
- Keep a log of what's happening: 
 - ultimate goal - to be able to describe where, when, by whom and for what reason the data were collected
- Keep a database of all samples collected
- Create metadata records of all data sets so they can be discovered
--


## Why?
- Backup to avoid losing data and to archive it properly for the future
- The data can be made publicly available after the 2 year embargo
- Make data easier to discover and usable by others in the future

--

Bear in mind: we had many other tasks (bigger one the email system)
---
# science-data-management
Data manager (Jen) said: Can you help me build a database?
--


I answered: yes! (and thought of MySQL and _create table_...)
--


Jen also meant a web system to enter data in the database!
---
background-image: url(images/for_fun/iceberg-light.jpg)
background-size: contain
---
template: inverse
# Django
---
I had used (to a certain extend):
- Python
- Flask
- MySQL
- SQLAlchemy
- Mustache
--


But... How would I create the forms to enter data into the database in an efficient way?
--


I asked a friend (thanks Fran!)... and he said...
--


# Django!
--

(I thought... nooooo... too big, no time to learn this now!)
--


Fran created a Django project with a small admin an example... and I loved it!
---
# My first week of Django
I went back home and really enjoyed learning Django:
- Writing Django models is easier than MySQL _create table_ (with foreign keys, etc.)
- I had done similar things 15 or 20 years ago without any framework: this was more productive!
- Thinking of writing all the authentication, permissions, admin-alike, migrations, integrate templates with models, etc. would be scary

---
# If you are new to Django...
I feel that for debugging certain issues it's needed to know:
- Python
- HTML
- CSS
- git
- Javascript
- jQuery
- HTTP
- Deployments
- SQL
- Database administration
- Server administration
- ...

Luckily I was familiar (more or less) many of these things
---
class: middle, center
# science-cruise-data-management
https://github.com/Swiss-Polar-Institute/science-cruise-data-management
---
background-image: url(images/for_fun/penguins_01.jpg)
background-size: contain
---
background-image: url(images/intranet_homepage.png)
background-size: contain
---
# How did we build the interface?
- Scientists used admin to enter, search, update data (also some visualizations outside admin)

--
- It did serve us very well! Authentication, permissions, less code to write and fewer things to integrate

--
- For the past year I've been working on two Django applications. I would do it differently now but it was very useful!
---
background-image: url(images/event_report.png)
background-size: contain 
---
# How the system grew during the expedition
- All focused on "we need this soon" and "this needs to last until end of April"

--
- Very rapid development. Initially focused on collecting data

--
- Make the data useful for the scientists as soon as possible: via maps, reports, validation

--
- Add small utilities that were useful (e.g. lat long converters, ship time to lat long, etc.)

--
- 3 years later: the system is still running in the institute internally for the data manager

---
background-image: url(images/intranet_location.png)
background-size: contain 
---
background-image: url(images/intranet_map.png)
background-size: contain 
---
# How it was to work practically off-line
No easy access to Stackoverflow/Google for 4 months.

- Django documentation is also available off-line: it's fantastic
- Django source code: a way to complement the documentation
- It was very handy that I had lot of (unrelated) source code in my laptop
- ipython + help method, etc.

--

I didn't use PDF books as much as I thought.

---
# In retrospect
Django was a very good tool to do what we had to do:
- Without Django we would have taken much longer to do the same 
- Django didn't get in the way (I had thought it would)
- Django _commands_ were very easy to implement and useful for accessing the models from command line parameters, widely used for many of our scripts
- Thanks Django developers for getting an extra mile with helpful error messages. E.g.:
```bash
main.Project.title: (fields.E120) CharFields must define a 'max_length' attribute.
```
--
- Django documentation is very well written!
- Admin forms were possible to adapt and change
???
If Django didn't exist I would have had to implement it for the expedition, in a hacky way
---
background-image: url(images/for_fun/ice_01.jpg)
background-size: contain
---
# What is Django?
From the Django website:
```bash
Django makes it easier to build
better Web apps more quickly and
with less code.
```
--


Data manager thinks:
```bash
We need to build a database
```
--

![images](images/clipart/light-bulb-idea.jpg)

???
Django for data managers and for other professions: cooks, biologists, etc.
---
template: inverse
# Thank you!

# Questions?
---
class: inverse
## Contact
- Carles Pina i Estany ([carles@pina.cat](carles@pina.cat))
## License
![CreativeCommons](external/creative-commons.png)

This work is licensed under a [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/).

## Slides
Slides have been written using Markdown and rendered using remarkjs (https://remarkjs.com)

Slides: https://github.com/cpina/ace-it-presentation / https://cpina.github.io/ace-it-presentation/

ACE: https://spi-ace-expedition.ch/  Swiss Polar Institute: https://swisspolar.ch
