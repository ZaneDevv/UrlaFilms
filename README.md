# UrlaFilms

Este repositorio contiene el proyecto final de *base de datos* del curso de desarrollo de aplicaciones web, realizado con [`Rucaor120`](https://github.com/Rucaor120).

## Herramientas utilizadas

Para la realización del proyecto, hemos hecho uso de *Oracle SQL* para la base de datos con *PL/SQL* y de *Netbeans* para el software de prueba realizado en *Java*

---

## Enunciado

Se quiere realizar una base de datos sobre el cine y  todos los aspectos  relacionados con él. Dentro de esta base de datos podemos encontrar  desde el título de la película hasta el precio de la entrada en el cine de  nuestra localidad.

Para empezar, las películas van a tener diferentes atributos como el  título, la duración, el género de la trama, el país donde ha sido rodada y  desarrollada, el tipo de escenarios en que se desarrolla y el año de  emisión en pantalla. Las películas también han sido dirigidas por directores, de los cuales se conoce su nombre completo, su edad y su  nacionalidad.

Sobre los guionistas y productores de las películas se conoce el trabajo previo realizado y su nombre completo. Dentro del cine, hay una parte  muy importante que la forma el cuerpo técnico, en el que encontramos  al personal de vestuario, iluminación, sonido, imagen, efectos especiales  y maquillaje.

Los actores que participan en las películas han debido superar un  casting de aptitud y capacidad de representación y presentar su  currículo. De los actores también  se conoce su nombre completo, su  edad y su nacionalidad.  Los actores pueden aparecer,  en la tabla que los relaciona con las películas,  múltiples veces, ya que un actor puede  haber participado en varios largometrajes.

Las salas de cine en las que son proyectadas las películas, las cuales  serán identificadas con un código, deberán especificar el tipo de  proyección que se hace, ya sea 2D o 3D, la taquilla expondrá los  horarios y  los precios de la película.  Encontraremos una relación obvia entre las películas y las salas de cine en las que se proyectan, en la que,  como antes hemos mencionado con los actores, las películas pueden  ser proyectadas en varias salas de cine.  Por último se debe señalar que,  una vez que las películas ya han sido emitidas en las salas de cine, estas  se comercializan, a través de puntos de venta o de alquiler.

---

## Instalación

La instalación del proyecto puede ser un tanto larga ya que debemos conseguir que nuestra base de datos se conecte correctamente.

Lo primero que se ha de hacer es crear un usuario con una contraseña en nuestra base de datos que permita a los códigos  *java* poder acceder a estos. Para evitar tener que entrear a los mencionados códigos, crearemos un usuario llamado  `system` con la contraseña `system1234` con permisos suficientes para poder interactuar con esta:

```sql
CREATE USER system
IDENTIFIED BY system1234;

GRANT CONNECT, RESOURCE, DBA TO system;
```

Dentro de este user, podremos crear la base de datos, la cual se encuentra en [`Tables.sql`](./database/codes/Tables.sql). En caso de ser necesitado, en el archivo [`TestingInserts.sql`](./database/codes/TestingInserts.sql) se encuentran ciertas queries inserts para poder probar todo.

A continuación, hace falta crear un proyecto **Ant** en *NetBeans* y, dentro de este, crear la conexión con la base de datos que acabamos de implementar en nuestro sistema. Dirigiéndonos al apartado *Services* encontramos una opción *Database* la cual nos permitirá con clic derecho crear esta conexión. Nos aseguraremos que el driver sea **Oracle Thin** y, en agregar, agregaremos el fichero `C:/oraclexe/app/oracle/product/<version>/server/jdbc/lib/ojdbc6.jar`.

## Uso de inteligencia artificial

Hasta fechas de escritura de este párrafo, se ha hecho uso de la inteligencia artificial para los datos que contienen las tablas en la base de datos;