# README

## Para qué es este repo?

Este repositorio ofrece un proyecto simple para empezar a trabajar con Selenium y Junit. 
Debéis hacer las modificaciones necesarias para adaptar las pruebas a la página que seleccionasteis. Una vez que terminéis debéis subir todo vuestro código al repo. 

Para este ejercicio tenéis que elegir al menos 5 casos de prueba de los que hayáis definido
en la primera práctica de esta unidad, y ejecutarlos haciendo uso de Selenium y JUnit.
El objetivo de estas pruebas es romper la página, es decir, encontrar errores en la misma, si
es posible, claro está.


## Pre-requisitos

Como requisitos previos se asumen nociones básicas de programación, concretamente este es un buen ejercicio si se parte de un paradigma de programación estructurada, para introducirse en la Programación Orienta a Objetos y en la programación de interfaces gráficas. 

* Declaración de variables. Tipo y ámbito.
* Uso de funciones. Principio de Reutilización del Código
* Estructuras básicas de datos
* Estructuras básicas de control
* Bucles
* Entrada y salida de datos
* Librerías


## Antes de ponerte a trabajar...

### Haz un fork del repositorio original

Haz un fork del repositorio original y **configúralo de forma pública**.

### Clona el repositorio

```
git clone <url de tu fork>
```

## Revisa periódicamente si se han producido actualizaciones en las especificaciones.

Cada vez que retomes tu trabajo asegúrate tener la última versión de las especificaciones. Para ello:

1. (**Sólo la primera vez**) Añade como repo remoto el repo del profesor desde el que has creado tu fork.

    `git remote add profesor <url-repoProfesor>`

2. (**Cada vez que retomes trabajo**) Revisa novedades y obtenlas del repo del profesor

    `git fetch profesor master`

3. (**Cada vez que haya novedades**) Mezcla estas novedades con tu *release branch*. Si has seguido las indicaciones de este README no deberían producirse conflictos. Si se produjesen adviértelo al profesor.

```bash
    # Asegúrate primero de estar en tu release branch
    git checkout rb-usuario
    
    # Después mézclate en tu rama actual las novedades
    git merge profesor/master
```


## Cuándo termines tu trabajo

### Etiqueta tu versión

Cuando tengas un revisión de tu código que consideres estable, etiquétala de la forma que te indique el [mecanismo de versionado](doc/README.md). 
Puedes hacer etiquetado de tu último commit de la siguiente manera:

```
# Si quieres hacer una etiqueta ligera (solo nombrar un commit
git tag <etiqueta>

# Si quieres hacer una etiqueta que contenga más información
git tag -a <etiqueta> -m 'El mensaje'
```

Si quieres poner una etiqueta a un commit anterior, pon su checksum al final de las instrucciones anteriores.

Recuerda enviar tus tags a tus repos remotos de la siguiente manera:

```
git push <remoto> <tag>
```

Consulta esta [fuente](https://git-scm.com/book/es/v2/Fundamentos-de-Git-Etiquetado) para más detalles.


## Who do I talk to?

* Repo owner or admin