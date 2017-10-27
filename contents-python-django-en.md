name: inverse
layout: true
class: center, middle, inverse
---
layout: false
template: inverse
class: title-slide
### Python and Django during the Antarctic Circumnavigation Expedition (ACE)
![images](images/title.apng)

.right[PyCon UK, 2017. Carles Pina i Estany (carles@pina.cat)]
---
layout: false
# What do we do for work?
## Carles
- C++/Qt software engineer at Mendeley
- Some Python (scripts at work, evenings and weekends, Python code Dojos, etc.)
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
 - file uploader / Dropbox equivalent;

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


But... How could I create the forms to enter data into the database?
--


I asked Fran... and he said...
--


# Django!
--

(I thought... nooooo...)
--


Fran created an example... and I loved it!
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
--


And it has very good off-line documentation!
---
# Django models
```python
class StorageCrate(models.Model):
    name = models.CharField(max_length=255, unique=True)
    location = models.CharField(max_length=255)
    description = models.CharField(max_length=255, null=True, blank=True)
    comment = models.TextField(null=True, blank=True)
```
--

- It creates the forms automatically
- If the model didn't exist: creates the tables in the database
- If the model already existed: creates the migration code
- Deals with foreign keys, relations, etc.
- It creates relational database models like we would have done
---
class: middle, center
# science-cruise-data-management
http://github.com/cpina/science-cruise-data-management
---
background-image: url(images/for_fun/penguins_01.jpg)
background-size: contain
---
background-image: url(images/intranet_homepage.png)
background-size: contain
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
# In retrospect
Django was a very good tool to do what we had to do:
- Without Django we would have taken much longer! 
- Django didn't get in the way as much as I had thought
- Django _commands_ were very easy to implement and useful for accessing the models from command line parameters, widely used for many of our scripts
- Django developers are very nice and helpful! Thanks for the concise error messages:
```bash
main.Project.title: (fields.E120) CharFields must define a 'max_length' attribute.
```
--
- Django documentation is very well written!
- Admin forms were easy to adapt and change
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

Django for data managers?
???
And for other professions: cooks, biologists, etc.
---
## Very useful Django features for us
- Admin forms were easy to adapt and change (we could work around something if it wasn't possible)
- _commands_ are fantastic!

--

## Django things that were not so helpful...
- Some modules use resources (CSS, js, etc.) from the Internet (e.g. debug module). This didn't work for us
- Hard to change (only via changing the template?) the main admin page
---
## pip and rsync 
pip wasn't "bad connection friendly":
- No progress bar
- We didn't see how to easily see the URIs being download (e.g. apt-get --show-uris to download them overnight)
- When bad networking: error messages weren't clear

--

man rsync, --progress:
```bash
This  option  tells  rsync  to  print  information  showing  the
progress of the transfer. This gives a bored user  something  to
watch.
```
I'd say "it helps my impatience".

--

## Python documentation 
More comprehensive off-line documentation could have been better (we relied on examples and source code)
---
# Django closing the circle
We wanted to thank Django somehow for all the fantastic help.

- I thought of fixing at least one bug that we experienced during the expedition
--

- Bug #28120 reported and fixed! (thanks for the quick code review, merge...)
---
# Python/Django ideas if you go on an expedition
- Take lots of code with you (e.g. Calibre, other projects, etc.). This was more useful than books and documentation
--

- Use an IDE like Pycharm that allows you to navigate code of your libraries easier
--

- Download the offline Django documentation: you will feel almost online!

--

Actually also download Wikipedia!
---
template: inverse
# Appendix: Internet on the ship
---
# Introduction
- We had 2 Iridium systems
- Initially one for calls, another one for Internet
- This is, 128 kbits for (officialy) 80 people
- The Iridium connections are very unstable
---
![NAS](images/Iridium_Coverage_Animation.gif)

L. Wood, SaVi: satellite constellation visualization, First Annual CCSR Research Symposium (CRS 2011), Centre for Communication Systems Research, 30 June 2011.
  http://arxiv.org/abs/1204.3265
---
# Iridium
- 66 Iridium satellites
--

- Iridium name: originally supposed to be 77 satellites: atomic number of Iridium
--

- There are spare satellites for when there are problems
--

- Signal on the north and south pole! But VERY slow and unstable: it connects and disconnects because satellites are not geostationary
--

- Satellites are around 780 Km above the Earth (GPS and Inmarsat around 20,000 Km)
--

- Sometimes the satellites are visible: Iridium flares!
--

- They are launching new satellites
---
background-image: url(images/iridium1.jpg)
background-size: contain
---
background-image: url(images/iridium2.jpg)
background-size: contain
---
background-image: url(images/slow_ping.jpg)
background-size: contain
---
template: inverse
# Thank you!

# Questions?
---
class: inverse
## Contact
- Carles Pina i Estany ([carles@pina.cat](carles@pina.cat))
- Jen Thomas ([jenny.thomas@epfl.ch](jenny.thomas@epfl.ch))
## License
![CreativeCommons](external/creative-commons.png)

This work is licensed under a [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/).

## Slides
Slides have been written using Markdown and rendered using remarkjs (https://remarkjs.com)

Slides: https://github.com/cpina/ace-it-presentation / https://cpina.github.io/ace-it-presentation/

ACE: http://spi-ace-expedition.ch/ 
