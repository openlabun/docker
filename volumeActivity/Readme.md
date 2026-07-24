# Práctica: Volúmenes compartidos en Docker

## Objetivo

Comprender cómo funcionan los **volúmenes en Docker** y cómo permiten **compartir datos entre contenedores**, incluso cuando estos se ejecutan de forma independiente.

Al finalizar esta práctica, el estudiante será capaz de:
- Crear y usar un volumen Docker
- Montar un mismo volumen en múltiples contenedores
- Verificar la persistencia y el intercambio de datos entre contenedores

---

## Descripción de la actividad

Inicie dos contenedores llamados **`c1`** y **`c2`** en **modo desacoplado (detached)** utilizando **el mismo volumen Docker** con la imagen **alpine:3.24** con el comando sleep infinity.

- Un contenedor debe **escribir un archivo** en el volumen.
- El otro contenedor debe **leer ese archivo** desde el mismo volumen.

El volumen debe llamarse **`my_shared_volume`** y debe montarse en la ruta **`/datos`** dentro de ambos contenedores.

---

## Pistas generales

- Los volúmenes pueden crearse automáticamente al iniciar un contenedor.
- Ambos contenedores deben montar **el mismo volumen** y en **la misma ruta interna (`/datos`)**.
- Recuerde que los contenedores son efímeros, pero los volúmenes no lo son.

---

## Pasos de la práctica

### Paso 1: Copiar los dos scripts en el contenedor `c1`

En una pestaña de la terminal, copie los archivos **`contador.sh`** y **`creador.sh`** dentro del directorio **`/datos`** del contenedor **`c1`**.

💡 **Pista:** usar el comando **docker cp**.

---

### Paso 2: Ejecución en el contenedor `c1`

Ejecute usando el contenedor **`c1`** el script **`contador.sh`**.

💡 **Pista:** es necesario dar permisos de ejecución al script con chmod +x <nombre archivo>.

💡 **Pista:** para ejecutar: sh <nombre archivo>.

💡 **Pista:** para ejecutar se necesita el flag -it.

---

### Paso 3: Ejecutar el contenedor `c2`

En otra pestaña de la terminal, ejecute en el contenedor **`c2`** el script **`contador.sh`**.

---

### Paso 4: Limpieza

Cuando termine la práctica, detenga el contador con **Ctrl+C**, elimine los contenedores **`c1`** y **`c2`** y, finalmente, elimine el volumen **`my_shared_volume`**.

💡 **Pista:** un volumen no puede eliminarse mientras algún contenedor lo esté usando; primero elimine los contenedores.

💡 **Pista:** use **docker rm -f <nombre contenedor>** y **docker volume rm <nombre volumen>**.

---

## Resultado esperado

- Ambos contenedores pueden acceder al contenido de **`/datos`**.
- El archivo creado o modificado por un contenedor es visible desde el otro.
- El volumen **`my_shared_volume`** mantiene los datos incluso si los contenedores se detienen o eliminan.

---

## Preguntas de reflexión

1. ¿Qué ocurre con los datos si se elimina uno de los contenedores?
2. ¿Qué ocurriría si cada contenedor usara un volumen diferente?
3. ¿Por qué los volúmenes son esenciales para aplicaciones con bases de datos?