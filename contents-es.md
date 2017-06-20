name: inverse
class: center, middle, inverse
---
template: inverse
# Dando la vuelta la Antartida con software libre 
.footnote[Carles Pina and Jen Thomas]
---
template: inverse
# Quienes somos
---
# Jen Thomas
- Data manager de BAS (Instituto Británico de la Antartida, Cambridge, Reino Unido) 
- Hobbies: pájaros, insectos...

---
# Carles Pina i Estany
- Nací en Manresa, cerca de Barcelona (España)
- Desde 2009 trabajo en Mendeley (departamento de Mendeley Desktop) trabajando en C++/Qt
- Normalmente vivo en Londres (Reino Unido) pero nos cogimos un año sabático para viajar
- Trabajo en Mendeley (departamento de Mendeley Desktop) trabajando en C++/Qt
desde el 2009
- Me gusta el software libre:
 - Uso GNU/Linux desde aproximadamente 1997
 - Uso Debian desde Debian Potato (2000)
 - qdacco (C++/Qt): está en Debian y Ubuntu
 - qphotosort (Python/Qt) y qnetload (C++/Qt)
 - He contribuido a Grub, Pidgin, geeqie, Amarok, Pydance, gnokii...
- En el año sabático acabamos en la Antártida
---
template: inverse
# Introducción
---
# ¿Qué es ACE?
- Antarctic Cicumnavigation Expedition
- Dimos la vuelta la Antártida!
- 22 equipos estudiando:
 - oceano
 - metereologia
 - aire
 - islas
- Unos 60 científicos en cada parte
- Unas 20 personas de soporte en la expedición
---
# Barco: Akademik Tryoshnikov
- Rompe hielos ruso
- 140 metros de ....
- 30? metros de ...
- Tripulación del barco: unas 70 personas
---
# Fechas clave
- Inicios de noviembre: David Walton contacta a Jen (en 6 semanas nos pusimos apunto: pruebas médicas, entender qué hacer, empezar una aplicación para los científicos)
- 22 de diciembre: inicio de parte 1 desde Cape Town (Sud África)
- 2X de enero: inicio de parte 2 desde Hobbart (Austrália)
- 2X de febrero: inicio de parte 3 desde Punta Arenas (Chile)
- 2X de marzo: llegamos otra vez a Cape Town (Sud África)
---
# ¿Dónde guardar los datos?
- A principios de diciembre Jen pregunta a los 22 investigadores principales cuantos GB necesitarán para almacenar sus datos
- Llegamos a una estimación de 60 TB
- Preguntamos al barco qué almacenamiento tienen
--

- Nos dicen que 500 GB (0.5 TB)
---
# Datos, datos, datos...
- Preguntamos, miramos, comparamos y al final compramos:
 - discos duros: 8 TB Western Digital x 15
 - discos duros: 8 TB Seagate x 15
 - NAS: 2 Synology DS-1815+
 - 2 Gigabit switches
 - 2 SAI APC
--

¡todo esto llegó a Sud África 2 días antes de salir!
---
# Datos, datos, datos...
¡Lo pusimos a punto!

![NAS](images/SNAS.jpg)

Incluyó bajarse 300 MB para los Synologys: tuve que correr a una cafeteria y después al hotel para bajarme los 300 MB.
---
background-image: url(images/seal_cape_town.jpg)
background-size: contain 
---
# La Base de Datos
- Teníamos que crear una base de datos para que los científicos introdujeran información de sus actividades
- Yo conocía Flask, Mysql, SQLAlchemy
- Pero como hacer los formularios para entrar todo? (a mano con Flask tardaría mucho) (y con C++/Qt sería muy difícil!)
- Estaba una noche en casa un amigo en Londres y le pregunté como lo haría él
--

- Dijo: ¡con Django!
--

- Y me hizo un proyecto pequeño en Django para que viera como funciona
---
class: middle, center
# ¡Gracias Fran!
---
# science-cruise-management
http://github.com/cpina/science-cruise-data-management

- Empecé a programar una semana... ¡la documentación de Django está muy bien!
- Fuí a casa Fran a preguntarle más cosas
---
background-image: url(images/event_report.png)
background-size: contain 

---


---
# Python example
Let's see something...

- Cool
- Useful

--

```python
#!/usr/bin/python3

print("This is a test")

if name=="ace":
*    print("Cool!")
```

---
class: inverse
# License
![CreativeCommons](external/creative-commons.png)

Esta obra está bajo una [Licencia Creative Commons Atribución-CompartirIgual 4.0 Internacional](https://creativecommons.org/licenses/by-sa/4.0/).

# Slides
Las slides han sido escritas usando Markdown y renderizadas usando remarkjs  (https://remarkjs.com) (¡es muy cómodo!)
