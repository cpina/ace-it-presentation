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
# Some admin
--

- You might hear firecrackers during the presentation

--
- I'm now in Catalonia (Spain)

--
- Today is St. John's evening

--

St John's tradition is...
---
background-image: url(images/st-john/bonfire.jpg)
background-size: contain
.footnote[.white[Copyright: Lee Haywood, CC-BY-2.0]]
---
background-image: url(images/st-john/fireworks.jpg)
background-size: contain
.footnote[.white[bayasaa, CC-BY-2.0]]
---
# St John
- It's the celebration (but 2 nights late!) of Summer solstice
--

- It's to scare witches
--

- It's celebrated in different parts of Spain and different countries

--

There are other Catalan traditions...
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
## Carles
- C++/Qt software engineer at Mendeley
- Some Python (scripts at work, evenings and weekends, Python Code Dojos, etc.)
- Using GNU/Linux for a long time
- Long time ago: system administrator / network administrator
--


## Jen
- Worked for 3.5 years at the British Antarctic Survey (BAS) as a data manager
- Now works for the Swiss Polar Institute, following up on the data management of ACE
- More into wildlife and science (especially birds) than programming
---
# What were our roles on the ship?
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
class: middle, center
# R/V Akademik Tryoshnikov
---
background-image: url(images/akademik_tryoshnikov_grytviken.jpg)
background-size: contain
---
background-image: url(images/rocking.jpg)
background-size: contain
---
# Why is ACE different?
- Usually science expeditions focus on a small area of the Antarctic
--

- Only other similar expedition was Discovery II in the 1950's
--

- Sampled and studied marine and terrestrial habitats
--

- First expedition of the Swiss Polar Institute
--

- It was organised very quickly
???
Mention that we were called 6 weeks in advance
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
background-image: url(images/south_georgia_ciencia.jpg)
background-size: contain
???
Terrestrial science
---
background-image: url(images/waves.jpg)
background-size: contain
???
Marine science
---
background-image: url(images/releasing_radiosonde.jpg)
background-size: contain
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
---
# We had many IT tasks
We juggled the data management with many other tasks:
--

- Setup the data storage (2 NAS, 64 TB, 2 UPS, etc.)
--

- Create utilities to backup from USB hard disks and network-attached computers

--
- Create an intranet webpage for the data entry, utilities and to disseminate information on board

--
- Design and implement an e-mail system that works with an unstable 128 kbit connection for 80 people

--
- Create a way to upload videos for the news (we had journalists on board)

--
- Download data (ice images, weather models) for the scientists

--
- Help scientists to connect different equipment (like snow flake counter)

--
- Fix a winch (software part)
--

- ...
---
# science-data-management
Jen said: Can you help me build a database?
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
I knew:
- Python
--

- Flask
--

- MySQL
--

- SQLAlchemy
--

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
???
Thought "nooooo..." because it's big, we didn't have time
---
# One week of Django
I went back home and really enjoyed learning Django:
- Writing Django models is easier than MySQL _create table_ (with foreign keys, etc.)
- Easier to change the models and migrate
- We needed authentication of users
- Permissions for tables were useful
- Templates are very well integrated with models
- All the admin part that we used has a good default UI
- Easy to extend

---
# If you are new to Django...
I feel that for debugging certain issues it's needed:
- HTML
- CSS
- Javascript
- HTTP
- Unit tests
- Deployments
- SQL
- Database administration
- Server administration
- ...

Luckily I knew, to a certain extend, many of these things
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
# What did we build?
- Scientists used admin

--
- It did serve us very well! Authentication, permissions, less code to write and fewer things to integrate

--
- For the past year I've been working on two big Django applications. I would do it differently now but it was very useful!
---
background-image: url(images/event_report.png)
background-size: contain 
---
background-image: url(images/intranet_location.png)
background-size: contain 
---
background-image: url(images/intranet_map.png)
background-size: contain 
---
# How I worked off-line
No easy access to Stackoverflow/Google for 4 months.

- Django documentation is also available off-line: it's fantastic
- Django source code: a way to complement the documentation
- It was very handy that I had lot (unrelated) source code in my laptop

I used lots of code that I had in the laptop.

--

I didn't use PDF books as much as I thought.

---
# What helped us?
- Django documentation
- Django admin
- Mails to Fran

---
# How the system grew during the expedition
- All focused on "this needs to last until end of April".

--
- Very rapid development. Initially focused on collecting data, later on outputing data.

--
- Make the data useful for the scientists as fast as possible: via maps, reports, validation.
---
# In retrospect
Django was a very good tool to do what we had to do:
- Without Django we would have taken much longer to do the same 
- Django didn't get in the way (I had thought it would)
- Django _commands_ were very easy to implement and useful for accessing the models from command line parameters, widely used for many of our scripts
- Thanks Django developers for getting an extra mile with helpful error messages:
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

ACE: http://spi-ace-expedition.ch/ 
