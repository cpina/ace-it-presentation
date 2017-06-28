name: inverse
layout: true
class: center, middle, inverse
---
layout: false
template: inverse
# Dando la vuelta la Antartida con software libre 
.footnote[Carles Pina and Jen Thomas]
---
template: inverse
# Quienes somos
---
layout: false
# Jen Thomas
- Data manager de BAS (Instituto Británico de la Antartida, Cambridge, Reino Unido) 
- Hobbies: pájaros, insectos...

---
# Carles Pina i Estany
- Nací en Manresa, cerca de Barcelona (España)
- Desde 2009 trabajo en Mendeley (departamento de Mendeley Desktop) trabajando en C++/Qt
- Normalmente vivo en Londres (Reino Unido) pero nos cogimos un año sabático para viajar
- Me gusta el software libre (uso Debian desde Debian Potato en el 2000)
- Algunos proyectos:
 - qdacco (C++/Qt): está en Debian y Ubuntu
 - qphotosort (Python/Qt) y qnetload (C++/Qt)
 - Estoy colaborando con Chronojump (C# y Python)
 - He contribuido a Grub, Pidgin, geeqie, Amarok, Pydance, gnokii...
 - Aplicación Benches para Android y iOS (OpenStreetMap, Python, Flask)
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
- 133 metros de eslora
- 23 metros de manga
- Tripulación: 60 personas

Alquilado para la expedición: casi todos los equipos llevaron su propio equipos. Sin informático abordo.
--


El barco no tiene estabilizadores
---
background-image: url(images/rocking.jpg)
background-size: contain
---
# Fechas del viaje
- Inicios de noviembre: David Walton contacta a Jen (en 6 semanas nos pusimos apunto: pruebas médicas, entender qué hacer, empezar una aplicación para los científicos)
- 22 de diciembre: inicio de parte 1 desde Cape Town (Sud África)
- 2X de enero: inicio de parte 2 desde Hobbart (Austrália)
- 2X de febrero: inicio de parte 3 desde Punta Arenas (Chile)
- 2X de marzo: llegamos otra vez a Cape Town (Sud África)
---
# ¿Dónde guardar los datos?
- A principios de diciembre Jen preguntó a los 22 investigadores principales cuantos GB necesitarán para almacenar sus datos
- Llegamos a una estimación de 60 TB
--


### Preguntamos al barco qué almacenamiento tienen
--

Nos dicen que 500 GB (0.5 TB)
---
# Datos, datos, datos...
- Preguntamos, miramos, comparamos y al final compramos:
 - 15 discos duros 8 TB Western Digital
 - 15 discos duros 8 TB Seagate
 - 2 NAS Synology DS-1815+
 - 2 Gigabit switches
 - 2 SAI APC
 - ...
--

¡todo esto llegó a Sud África 2 días antes de salir!
---
# Datos, datos, datos...
¡Lo pusimos a punto!

![NAS](images/SNAS.jpg)

Incluyó bajarse 300 MB para los Synologys: corrí a una cafeteria y después al hotel para bajarme los ficheros necesarios.
---
# Material sobrante
En un barco hay uno de recambio de casi todo.

Compramos material sobrante (discos, switches, etc.) ¡Durante un mes no teníamos acceso a ninguna tienda!
---
background-image: url(images/propeller_blade.jpg)
background-size: contain 

???
Explicar como cambiar: dry dock o bien ¿playa cuando baja la marea?
Tienen que estar equilibrados o sinó no va bien
---
# La Base de Datos
- Teníamos que crear una base de datos para que los científicos introdujeran información de sus actividades
- Yo conocía Flask, Mysql, SQLAlchemy
- Pero como hacer los formularios para entrar todo? (a mano con Flask tardaría mucho) (y con C++/Qt sería muy difícil!)
- Estaba una noche en casa un amigo en Londres y le pregunté como lo haría él
--

- Dijo: ¡con Django!
(yo pensaba que no quería Django, que era demasiado grande)
--

- Y me hizo un proyecto pequeño en Django para que viera como funciona
---
class: middle, center
# ¡Gracias Fran y Django!
---
# science-cruise-management
http://github.com/cpina/science-cruise-data-management

- Empecé a programar durante una semana... ¡la documentación de Django está muy bien!
- Visité a Fran para preguntarle más cosas
- Y hicimos una Intranet con Django
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
# Mapa
- Yo había usado la librería Leaflet (sobretodo por Benches)
--

- Queríamos hacer un mapa de la expedición:
 - ¿Dónde estábamos?
 - ¿Dónde han pasado los eventos?
--

- Pero la proyección del mapa no es la estándard
---
background-image: url(images/intranet_map.png)
background-size: contain 
---
# Proyección del mapa
- Leaflet tiene soporte para proyecciones (con un plugin)
- La Antártida normalmente se visualiza con proyección EPSG:3031
- No hay tiles renderizadas con la proyección
- En lugar de tiles usé coastlines: describen el contorno
- Pasé las coastlines del formato original a geojson (para que Leaflet lo cargara)
---
template: inverse
# Sistema informática expedición en el barco
---
# Servidores hardware
- En un portátil viejo: Ubuntu 16.10 (se calentaba, etc.).
- (segundo mes): Añadimos un portátil nuevo con Ubuntu 16.10

## Tareas de los servidores
- Django (ver más tarde)
- Sistema de email (ver más tarde)
- Subir/bajar ficheros internet (ver más adelante)
- DNS (Bind) (para http://ace-intranet.lan, http://ace-mail.lan)
- DHCP Server (ISC DHCP)
- Servidor git interno (no podíamos depender de nada de internet)
- Importar datos GPS (ver más adelante)
- Copias de seguridad de diferentes ordenadores (ver más adelante)
- Copias de seguridad entre NAS1 y NAS2 (rsync)
- Reiniciar el router TP-Link a media noche (o por la mañana...)

???
-OSX no resuelve dirección dominios si no tiene conexión a internet?
-Primero reiniciaba el router a mano desde la habitación pero entonces me olvidaba y tenía que levantarme o la gente por la mañana me esperaba...
---
template: inverse
# Internet en el barco
---
# Introducción
- Teníamos 2 antenas Iridium.
- Inicialmente una para llamadas, otra para Internet
- Esto son, 128 kbits para _oficialmente_ 80 personas
--

- Las conexiones via satélite de Iridium son MUY inestables
---
# Iridium
- La constelación tiene 66 satélites operativos
--

- Nombre Iridium porqué originalmente habia 77 satélites: el número atómico de Iridium
--

- Hay cobertura en el polo norte y sur! Pero MUY lento y inestable: se conecta y desconecta porqué no son geostacionarios y hay cambios de satélite
--

- Los satélites estan a unos 780 Km de la tierra (GPS a unos 20.000 Km)
--

- Por la noche a veces se pueden ver (como estrellas fugaces)
--

- Tienen satélites de sobras: los activan y ponen en el plano cuando hay problemas
--


Estan lanzando satélites de nueva generación
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
# Reproducir vídeo:
## iridium-apt-get-update.ogv
---
# VSAT
- No usamos VSAT durante la expedición
- Cuando funcionaba (en el hemisferio norte) con el contrato que el barco tenía: ¡unos 10 Mbps estables!
- La antena apunta simpre (con motores) al satélite geostacionario
---
background-image: url(images/iridium3.jpg)
background-size: contain
---
# Necesidades de comunicaciones
- Científicos necesitan:
 - Bajar imagenes de satélite de hielo
 - Bajar modelos meterologicos
 - Comunicarse con sus equipos
 - Comunicarse con família
- Periodistas necesitan:
 - Subir fotos
 - Subir vídeos!
---
# Setup parte 1
- Un router TP-Link conectado al Iridium
- Dos cables con ancho de banda "ilimitado"
- El sistema WiFi como red de invitados y como máximo el 50% o 70% de velocidad y menos prioridad
???
La priorización sólo no funcionaba bien porqué la conexión es inestable
---
# Email
- Recomandamos usar Thunderbird en cada portátil y usar la conexión cable
- Fué bastante mal:
 - Windows tiene time outs cortos (e.g. para DNS)
 - Thunderbird tiene problemas con conexiones inestables (y mala información para el usuario)
 - Tuvimos que configurar muchos Thunderbirds de diferentes proveedores
 - Nunca sabíamos si había un error de configuración o bien de conexión

???
¡Mucha gente casi golpeando portátiles!
---
# Whatsapp
En el WiFi como invitados mucha gente usaba WhatsApp.

- En iPhone no se puede escribir si el teléfono no está conectado (!)
- En Android los mensajes salían y llegaban pero a veces tardaba horas
- La gente dejaba teléfonos en la oficina que también saturaban la conexión (con updates, etc.).
- No siempre funcionaba
---
# Bajar datos científicos
- Con un rsync bajábamos datos científicos de noche (90 minutos para 15 MB más o menos, con las desconexiones)

--

```bash
until rsync -e "ssh -o ConnectTimeout=120 -o ServerAliveInterval=120" -vtaz --progress --inplace --timeout --bwlimit=10k
do
    date
done
```
--

El código es un reflejo de como es el programador
--


¡Bien persistente! (y con paciencia)
---
# Resumen comunicaciones parte 1
- Mucha frustración: gente que no podía enviar mails o recibir durante días
- En un entorno de estrés: tormentas, problemas técnicos, gente que su doctorado depende de la expedición, etc.
- Periodistas esperandome a las 7 de la mañana diciendo "Me levanté a las 4 y no he podido enviar ningún WhatsApp!!!!"
- Gente furiosa golpeando los portátiles
---
template: inverse
# Internet parte 2
---
# Sistema de email
Cuando llegamos a Austrália:
- Compré (para 3 meses) un servidor VPS
- Configuré Postfix (SMTP) i Dovecot (IMAP)
- Configuré un servidor (un portátil) en el barco con Roundcube (Webmail), fetchmail (cliente IMAP) y Postfix.
- Con Django hicimios un sistema para crear usuarios en el servidor del barco y en el servidor de Internet
---
# Crear los usuarios
Como tenía poco tiempo el script de Django sencillamente imprimía los comandos y los copié-pegué en el servidor local o remoto:
## Local
```bash
useradd --create-home carles.pinaestany
echo carles.pinaestany:ahf5ze | chpasswd
useradd --create-home jen.thomas
echo jen.thomas:ahf5ze | chpasswd
```
---
## Remoto
(también generado por el script de Django):
```bash
useradd --shell /bin/false --create-home carles.pinaestany
echo carles.pinaestany:Aib3gah0oTh5ii1pai0t | chpasswd
echo carles.pinaestany | saslpasswd2 -u ace-expedition.net Aib3gah0oTh5ii1pai0t
#####
useradd --shell /bin/false --create-home jen.thomas
echo jen.thomas:Bae5hahgho1iephuu5qu | chpasswd
echo jen.thomas | saslpasswd2 -u ace-expedition.net Bae5hahgho1iephuu5qu
```
---
# Envío de emails
- Limité el tamaño máximo de mail a 50 KB (en Roundcube y en Postfix)
--
(después incrementamos el tamaño a 200 KB)
--

- Limité el número de conexiones del Postfix del barco al Postfix de Internet a máximo 2 para evitar saturar la conexión
---
# Recepción de emails (sistema 1)
- Con Django generé un .fetchmailrc que bajaba todos los emails de todos los usuarios (máximo de 50 KB).
- Resultado:
 - Si no había emails tardaba unas 4 horas a ir a cada usuario y mirar si había algun email (el protocolo IMAP tiene muchas comunicaciones inecesarias con una latencia alta es muy lento)
 - Si la conexión no funcionaba: fetchmail "ignoraba" este usuario hasta la próxima pasada
 - Los emails podían tardar 8 horas a ser recibidos! (y sólo si eran del tamaño decidido)
- fetchmail es ideal:
 - time outs altos por defecto
 - buena opción -v (con el protocolo IMAP paso a paso)
---
# Recepción de emails (sistema 2)
- Con Django generé un .fetchmailrc de sólo los usuarios de la parte 2 del viaje (se redujo el tiempo de espera de 4 horas a unas 2 horas)
---
# Recepción de emails (sistema 3, definitivo)
Pensé que quería sólo recoger los emails de los usuarios que tenían emails. Y en orden de recepción de los emails.

Miré como organiza Dovecot los emails y a ver si podía saber fácilmente qué usuarios tenían emails en el servidor de Internet que deberían ser bajados.
--

Dovecot deja los emails nuevos en /home/$USERNAME/Maildir/new

Además el nombre del fichero contiene el timestamp de recepción! P. ej: 1498094976.24034_1.servidor64
---
## Escoger qué usuarios tienen mails a bajar
### Script en el servidor de Internet
Un script en Python (en shell hubiera sido posible también) escaneaba todos los /home/* y imprimía en la stdout:
```
/home/carles.pinaestany/Maildir/new/1498094976.24034_1.servidor64
/home/john.doe/Maildir/new/1375352537.24034_1.servidor64
```
Script: https://github.com/cpina/science-cruise-data-management/blob/master/ScienceCruiseDataManagement/utilities/messages_to_download.py
---
### Script en el servidor del barco
```python
cmd = "ssh -o ConnectTimeout=120 -o ServerAliveInterval=120 root@{} \
./messages_to_download.py > '{}'".format(settings.IMAP_SERVER, output_file_path)
```
Entonces en el "output_file_path" hay la salida del script del servidor y el script local ordena qué usuarios bajar primero (los usuarios con los mails más viejos).

El script de Python entonces genera "fetchmailrc" para este usuario y ejecuta:
```python
fetchmail --timeout 120 --fetchmailrc {} --pidfile {}".format(file_name, pidfile)
```
Hasta que funcione! (en un while)

Script: https://github.com/cpina/science-cruise-data-management/blob/master/ScienceCruiseDataManagement/main/management/commands/downloademailsbyage.py
---
# Emails demasiado grandes
- Durante unos días la gente no sabía si habían recibido emails demasiado grandes
- Hice un email notifier. Usé Python con imaplib (imaplib para conectarse y ver qué emails son grandes)

Script: https://github.com/cpina/science-cruise-data-management/blob/master/ScienceCruiseDataManagement/main/management/commands/warningoversizeemail.py
---
# Emails demasiado grandes
En todos los scripts muy importante pensar que la conexión es inestable. El oversize email notifier empezó a funcionar consistentemente cuando hice:
```python
while True:
    try:
        print("Checking: {} {}/{}".format(email_account.email_address, index+1, len(emails_active_leg)))
        self.check_user(email_account.email_address)
        break
    except ConnectionResetError:
        print("Connection Reset Error for user: {}. Trying again".format(email_account))
    except socket.timeout:
        print("Connection timeout Error for user: {}. Trying again".format(email_account))
    except OSError:
        print("Probably 'Network is unreachable' error for user {}. Trying again".format(email_account))
```
---
# Emails demasiado grandes
warningoversizeemail.py hacia:
- Enviar un email para notificar al receptor que un email era demasiado grande
 - Contenía el tamaño, subject, remitente y UID
- Guardaba el email UID y otra información en una tabla (así sólo se notificaba una vez que había un email grande)

El mail de notificación decía "si este email es muy importante reenvia la notificación al equipo de data management"
---
# ¿Cómo bajamos los emails grandes?
- Una idea sería usar fetchmail sin el límite de maximo email. Pero la conexión era MUY inestable, bajarse algo de más de 500 KB era difícil
--

- Divide and conquer
--


# rsync!
--

¡Usar rsync para bajar emails!
(o "IMAP over rsync")
---
# downloademail.py
- Dado el usuario y email UID se baja el fichero con rsync a una carpeta IMAP nueva (Downloaded emails) (va probando hasta que funciona!)
- Añade la carpeta "Downloaded emails" en las carpetas del usuario (Dovecot: muy bien! Es un fichero de texto que se llama "subscriptions"
---
# Como enviar emails grandes?
- Los usuarios venían y nos llevaban ficheros grandes (más de la capacidad del mail máxima). En una memória USB, carpeta compartida, etc.
- A veces lo subíamos con un script (until rsync - sigue probando) al servidor de Internet en /var/www/uploaded/misc/nombre_fichero.zip
- Otras veces lo poníamos en una cola durante la noche
---
# Subir/bajar ficheros durante la noche
(esto fué la parte 2 y 3, la 1 era caos)

- Los periodistas tenían una carpeta compartida y copiaban ficheros allá
- Los ficheros y directorios se subían a http://ace-expedition.net/files/FECHA/ (con un máximo de 30 MB al dia)
- Se bajaban datos para científicos
- Se subía "la cola" (hasta las 8 de la mañana)
---
# La cola: rsync_queue.py
Ver: https://github.com/cpina/rsync-queue

Un script que subía ficheros de un directorio en orden alfabético.
--

Los ficheros que nos pasaban los copiabamos con orden de preferencia:
```
010-john-photos_of_fish.zip
020-jen-video.zip
030-james-test_files.zip
```
---
# La cola: rsync_queue.py
- Cuando un fichero era subido: se mandaba un mail a nosotros con el enlace y se movía el fichero a uploaded
- A las 8: killall rsync_queue.py (y este manda un mail a nosotros con el estado de subido del fichero)
- Internamente usa rsync con la opción --progress y así puede informar via email o puede generar un fichero de log con la salida

Ver: https://github.com/cpina/rsync-queue/blob/master/rsync_queue.py#L96
---
# rsync --progress

Del "man rsync":
```
  --progress
      This  option  tells  rsync  to  print  information  showing  the
*     progress  of  the transfer. This gives a bored user something to
*     watch.  With a modern rsync  this  is  the  same  as  specifying
```
---
# Otros datos científicos
- En algunos casos datos científicos no estaban disponibles en Internet con rsync
--

- Lo mejor era bajarlos con wget en el servidor de Internet...
--

- ...y usar rsync para bajarlos al barco
---
# Usando los dos Iridiums para datos
- Conecté el Iridium de teléfono a la red de datos para subir ficheros cuando no había llamadas
- En el servidor de internet: redirigí el puerto 2222 al puerto 22
- En el servidor del barco: tenía un default gw (Iridium1). Pero paquetes que iban al puerto 2222 los marcaba para ir a un gw diferente: Iridium2
- Tenía dos rsync_queue.py: uno que usaba el puerto 22 y el otro el puerto 2222.
???
Hablar del sabotaje?
- Desconectar el cable
- Conectarlo a un sitio diferente
- ...
---
template: inverse
# La web intranet
---
# Django
- No sabíamos Django antes de empezar
- Tiene muy buena documentación off-line
- Yo tenía mucho código Python en mi ~/git (código mío o código como Calibre)
---
# ¿Por qué era muy cómodo?
- Escribiendo un modelo genera formularios
- Cambiando el modelo hace las migraciones en la base de datos
- Tiene sistema de permisos de usuarios
---
# Modelos en Django
```python
class StorageCrate(models.Model):
    name = models.CharField(max_length=255, unique=True)
    location = models.CharField(max_length=255)
    description = models.CharField(max_length=255, null=True, blank=True)
    comment = models.TextField(null=True, blank=True)
```
--
- Genera los formularios
- Genera la tabla en la base de datos si no existia
- Genera migraciones si existía diferente
---
# Models en Django
- Es muy fácil acceder a la base de datos y crear objetos automáticamente
- 
---
# Django
- Sistema de plantillas
--

- Sistema de API en JSON
--

- Sistema de comandos para interactuar con los modelos
---
---
template: inverse
# Backups
---
# Origen
- De recursos compartidos
- De discos duros
- De zona "staging"
---
# Backups de recursos compartidos
- Fuímos a cada ordenador que recogía datos en el barco (muchos con Windows)
- Compartimos la carpeta (en sólo lectura)
- Asignamos una IP estática
- Teníamos un model en Django que específicabamos:
 - IP
 - Usuario
 - Contraseña
 - Volumen
 - Destino
???
Cada vez que queríamos añadir un recurso compartido sólo era añadir en esta table
---
# Backups recursos compartidos
- Teníamos un mail con el resultado del último backup
- Y una tabla en la base de datos con los últimos resultados
--
La idea es un script en Python que usa rsync y es hace los mount/rsync/umount basado en los datos que hay en el model (tabla)
---
# Trabajar con científicos
- En Mendeley muchos de nuestros usuarios son científicos.
--

- En la expedición tenía un trato más cercano
--

- Anecdota: científico y hoja de Excel
---
template: inverse
# Ferrybox
---
# Ferrybox
- Un Ferrybox lee continuamente datos del agua. Normalmente temperatura, salinidad, cantidad de oxígeno, fluorescencia
--

- La Ferrybox del barco tenía un problema: sólo guardaba los datos cuando se llegaba a un puerto (los científicos lo querían en tiempo real)
--

- La Ferrybox era una Debian Etch
--

- Para escribir en ficheros: mount -o rw,remount /
--

- Cambié la configuración de red para unirlo a la red de la expedición
---
# Ferrybox: tener un volcado en tiempo real
- El processo "ferrycon" lee de /dev/ttyS[0,1,2,3] que son los dispositivos
--

- Hice unos scripts en Python (Python 2.5!) para leer de /dev/ttyS0 y escribir en ficheros (información sin calibrar pero lo podían recalibrar)
--

- Nos dimos cuenta que había muchos errores: a veces en los ficheros generados con Python, a veces en los ficheros generados con "ferrycon"
--

- En Linux dos procesos pueden leer del puerto serie pero entonces hay "interferencias" (se consumen los bytes, paridad, etc.)
--

- Desactivé los procesos en Python que leían del puerto serie...
---
# Ferrybox: tener un volcado al dia
- Nos dijeron que "/ferrybox/bin/ferrycon audit -R" mostraba todos los datos
--

- Hice un script que cada noche hacía "ferrycon audit -R" y guardaba los datos del dia anterior en un fichero
--

- Copié el binario de rsync de Debian Etch a ~/bin/rsync , desde otro ordenador copiaba los ficheros usando "rsync --rsync-path=/home/ferrybox/bin/rsync ferrybox@ferrybox.lan:/var/ferrybox/data ."
--

- Y ya teníamos un fichero correcto al dia!

---
# Ferrybox: tener información a tiempo real
- Nos dijeron (soporte Ferrybox) que "/ferrybox/bin/ferrycon audit -R -p -f testpointer.ack" mostraba los datos y escribía donde se había acabado de escribir (y la próxima vez sólo mostraba lo nuevo)
--

- No funcionaba:
```
"No "FerryLogData" service found on node <1>"
```
--

- Usé "strace" para ver qué pasaba... y ferrycon intentaba hacer el fichero en un directorio que no existia:
```
open("/var/ferrybox/log/testpointer.ack.ack", O_RDWR|O_CREAT|O_TRUNC,
0666) = -1 EACCES (Permission denied)
```
--

- Creé el directorio, puse los permisos y ya se pudo generar el fichero adecuado para exeuctar "ferrycon audit -R -p -f testpointer.ack"
---
# Ferrybox: enseñar la información a tiempo real
- En el servidor hice un script en Python para ejecutar:
```bash
ssh fbuser@ferrybox.lan /home/fbuser/bin/output_last_information.sh
```
Cada 5 minutos, desde un script en Python que captura el stdout, lo parsea y lo pone en una base de datos (https://github.com/cpina/science-cruise-data-management/blob/master/ScienceCruiseDataManagement/ship_data/management/commands/getferryboxdata.py)
--

-Usando Django, una vista, template y Chart.js hice una visualización de Ferrybox
---
template: inverse
# Missing files
---
# Cambios de nombre de ficheros
- Cada hora se hacía una copia de los ficheros de ordenadores usando rsync
--

- Algunos científicos cambiaban los nombres de los ficheros: algunos ficheros estaban duplicados (con diferentes nombres)
--

- Queríamos ver si había ficheros en un directorio que no estaban en otro directorio (en este caso sólo el nombre de los ficheros, no por contenido). Así nació:
http://github.com/cpina/missing-files
--

- Había hecho uno parecido para contenido de ficheros
---
template: inverse
# Otras tareas
---
# Otras tareas
- Alguien escribió un texto en un fichero de texto y quería pasarlo via WhatsApp
--

- Un dispositivo con una RaspberryPi no se conectaba al WiFi
--

- Dispositivo requería Access Point que no llegó al barco
--

- Disco duro que no se podía montar en Windows
--

- Un dispositivo Bluetooth que no se conectaba al ordenador (imán)
--

- Y un sin fin más!
---
template: inverse
# CTD Winch
---
# CTD
- Dispositivo que ligado a un winch (grua) y cuando baja lee la "Conductivity, Temperature and Depth"
---
background-image: url(images/ctd_lab.jpg)
background-size: contain
---
background-image: url(images/ctd_water.jpg)
background-size: contain
---
# CTD
- Al bajar (teníamos cable hasta 8000 metros pero en la expedición sólo usábamos hasta 1500 metros
- Se cierran las botellas cuando se sube el CTD para recoger agua del fondo del mar
- Muchos proyectos usan agua del CTD
---
# CTD: el problema
- Un dia me dijeron que la tripulación no podía cambiar parámetros del CTD (no aparecía el teclado en pantalla)
--

- Encontramos que el CTD Winch tenía un cable de red y que la pantalla mostraba una IP cuando se iniciaba
--

- Conecté el portátil al cable de red, puse una IP, un nmap... y tenía un servidor de VNC (era un Windows CE)
--

- Me conecté con VNC (xtightvnc, krdc, etc.) y pude escribir en el campo donde no aparecía el teclado
--

- ¡Pero no aceptó el valor!
---
# CTD: solución
- Tuvimos muchos emails, llamadas, etc. con la empresa que instaló el CTD (Adrian Winch)
--

- Pasamos fotos del problema, comparamos notas, etc. hasta que nos dieron el software para reinstalar (lo bajé en Austrália, eran unos 500 MB)
--

- Con Linux formateé un pendrive con FAT12 (!) pero cuando cargó el nuevo sistema no funcionó (pánico)
--

- Dentro de sus ficheros encontré otra imagen que sí que funcionó... al menos unos días porqué más problemas pasaron
---
background-image: url(images/ctd_cup.jpg)
background-size: contain
---
template: inverse
# Instalar paquetes Debian en otros ordenadores
---
# Instalar paquetes Debian en otros ordenadores
- Gente con Ubuntu que necesitaban paquetes que no tenían
--

- Empecé a usar:
```
tar -T /tmp/files.txt -cvf /tmp/gnuplot-data.tar
```
---
template: inverse
# GPS
---
# GPS Introducción
- Llegué y era importante que tuvieramos todos los datos del GPS guardados
- Para saber "¿Dónde estábamos en la fecha+hora D?" (esto alimentaba la base de datos automáticamente)
- No había nada para esto
---
# GPS Trimble
- Un ordenador con Windows de la expedición ya tenía acceso a un GPS (por puerto serie)
--

- Este Windows ya tenía instalado el software Serial Port Splitter (https://www.eltima.com/products/serialsplitter/)
--

- Bajé + instalé GPS NMEA Router software (http://arundale.com/docs/ais/nmearouter.html)
--

- Compartí el directorio donde se guardaban los logs
--

- Escribí un parser de NMEA leyendo los ficheros en tiempo real (con rotación de ficheros): lo insertaba a la base de datos (https://github.com/cpina/science-cruise-data-management/blob/master/ScienceCruiseDataManagement/ship_data/management/commands/nmea_file2db.py)
- (el parser NMEA es bastante interesante por la clase TailDirectory: lee continuamente del fichero, usa un callback para líneas enteras, comprueba nuevos ficheros en el directorio, etc.)
---
# GPS Puente de comandamiento (1/2)
En la primera isla descubrí que el GPS no funcionaba (o la red? O el Windows? o la base de datos? O el visualizador?)
--

- La tripulación lo apagó
--

- Buscamos un segundo GPS en el barco: encontramos el del puente de comandamiento
--

- La tripulación usó Franson GpsGate y "envió" los datos del GPS a nuestra IP via UDP
--

- (la tripulación añadió una nueva IP de una nueva red a su tarjeta de red a su switch, yo añadí un nuevo dispositivo USB para la nueva red)
--

- Con ngrep (y tcpdump) ví que sí, llegaban los datos... pero no sabia como guardarlos!
---
# GPS Puente de comandamiento (2/2)
- Investigué, bajé y compilé kplex: lee del puerto UDP, lo sirve en TCP (útil para tenerlo en otros ordenadores en tiempo real en mi red), lo guarda a un fichero
--

- Pero kplex (http://www.stripydog.com/kplex/index.html) no tiene soporte para "un fichero diferente cada dia"... hice un script que modificaba el fichero de configuración y reiniciaba kplex cada dia a media noche

???
Qué hay como Serial Port Splitter en Linux?
---
# Recomendaciones para una expedición similar
- Internet:
 - Configurar un sistema de mail específico
 - rsync para todo (subir/bajar ficheros, emails, etc.)
 - usar links
- Otros problemas:
 - Pensar que todo es solucionable (aunque sea con workarounds)
 - Proponer alternativas en el barco, o que alguien de su equipo busque y envie, etc.


Nota: usé casi todo lo que sé (de hackdays, de cuando empecé a jugar con puertos paralelos, universidad, trabajos anteriores, etc.)
---
class: inverse
# License
![CreativeCommons](external/creative-commons.png)

Esta obra está bajo una [Licencia Creative Commons Atribución-CompartirIgual 4.0 Internacional](https://creativecommons.org/licenses/by-sa/4.0/).

# Slides
Las slides han sido escritas usando Markdown y renderizadas usando remarkjs  (https://remarkjs.com) (¡es muy cómodo!)
