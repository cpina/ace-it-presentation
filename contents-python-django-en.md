name: inverse
layout: true
class: center, middle, inverse
---
layout: false
template: inverse
class: title-slide
### Python and Django during ACE (Antarctic Circumnavigation Expedition) 2016-2017
![images](images/title.apng)

.right[Carles Pina i Estany (carles@pina.cat)]
---
layout: false
# Contents
- What is ACE?
---
# What do we do for work?
## Carles
- C++/Qt software engineer at Mendeley
- Python fan (scripts at work, evenings and weekends, Python code Dojos, etc.)
- Using GNU/Linux for a long time
--


## Jen
- Worked 2 years at the British Antarctic Survey (BAS) as a data manager
- 2 years ago did the Django girls course
- Less computer savy and very much into animals and nature
---
# ¿What were our roles on the boat?
- Jen was the data manager
- Carles was the software engineer to help building the data management system, telecomunications, connecting science equipment, setting up the storage, etc.
---
class: middle, center
# What is ACE?
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
class: middle, center
# Science 
---
background-image: url(images/ace_team.jpg)
background-size: contain

.footnote[Copyright Swiss Polar Institute]
---
background-image: url(images/south_georgia_ciencia.jpg)
background-size: contain
---
background-image: url(images/waves.jpg)
background-size: contain
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
- Keep a log of what's happening, where, when
- Keep a sample database
- Create metadata records
--


# Why?
- Backup to avoid losing data and have the data after the 2 year embargo
- Log events to make all the data more useful and be able to discard data if some equipment was faulty
- To know what was collected
- Make data easier to discover
---
# We had many IT tasks
- Setup the data storage (2 NAS, 64 TB, 2 UPS, etc.)
--

- Create utilities to backup from hard disks, shared volumes, etc.

--
- Create an Intranet webpage for the data entry, utilities, etc.

--
- Design and implement a mail system that works with unstable 128 kbits for 80 people

--
- Create a way to upload videos for the news (we had journalists on board)

--
- Download data (ice images, weather models) for the scientists

--
- Help scientists connecting different equipment (like snow flake counter)

--
- Fix a winch (software part)
--

- ...
---
# science-data-management
- Jen asked: Will you help me building a database?
--

- I answered: yes! (and thought of Mysql and _create table_...)
--


Jen also meant a database interface!
---
background-image: url(images/for_fun/penguins_02.jpg)
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

- Mysql
--

- SQLAlchemy
--

- Mustache
--


But... How should I create the forms to enter data into the database?
--


I asked Fran... and he said...
--


# Django!
--

(I thought... nooooo...)
--


Fran created an example... and I loved it!
---
# One week of Django
I went back home and really enjoyed learning Django:
- Writing a Django models is easier than Mysql _create table_ (with foreign keys, etc.)
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
- The Mysql tables are like we would have created (we used Mysql straight away as well)
---
class: middle, center
# science-cruise-data-management
http://github.com/cpina/science-cruise-data-management
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
# Django summary
- Without Django we would have taken much longer! 
- Django didn't get on the way as I had thought
- Django "commands" were very easy to implement and useful to access the models from command line parameters
???
If Django didn't exist I should have implemented for the expedition, in a hacky way
---
background-image: url(images/for_fun/clouds_02.jpg)
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
I need to build a database
```
--

And Jen had done the Django tutorial... on building a blog.
---
# Django 
- Without Django it would have been much harder!
- Django courses for data managers? How to build _databases_ with Django?

---
# Django closing the circle
We wanted to thanks Django somehow for all the fantastic help.

- We decided to fix at least one bug that we experience during the expedition
--

- Bug reported #28120 and fixed! (it was easy)
---
# Django is easy
I was 
---
template: inverse
# Internet on the ship
---
# Introducción
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

- Iridium name: originally had to be 77 satellites: atomic number of Iridium
--

- There are spare satellites for when there are problems
--

- Signal on the north and south pole! But VERY slow and unstable: it connects and disconnects because satellites are not geostacionary
--

- Satellites are around 780 Km from the Eart (GPS and Inmarsat around 20.000 Km)
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
# Play video
## iridium-pip-install.ogv
---
# Ideas if you went to an expedition
- Take LOTS OF CODE with you (e.g. Calibre, other projects, etc.). This was more useful than books and documentation
--

- Use an IDE like Pycharm that allows you to follow code of your libraries easier
--

- Download the offline Django documentation: you will feel almost online!
---
class: inverse
## Contact
- Carles Pina i Estany ([carles@pina.cat](carles@pina.cat))

## License
![CreativeCommons](external/creative-commons.png)

Esta obra está bajo [Licencia Creative Commons Atribución-CompartirIgual 4.0 Internacional](https://creativecommons.org/licenses/by-sa/4.0/).

## Slides
Slides have been written using Markdown and rendered using remarkjs (https://remarkjs.com)

For the main slide apng: apngasm (Debian package)

Slides: https://github.com/cpina/ace-it-presentation / https://cpina.github.io/ace-it-presentation/