# <center>CIU - Práctica 3</center>

## Contenidos

* [Autoría](#autoría)
* [Introducción](#introducción)
* [Controles](#controles)
* [Implementación base](#implementación-base)
    * [Definición de la estructura](#definición-de-la-estructura)
    * [Traslación de los objetos](#tre¡traslación-de-los-objetos)
* [Implementaciones adicionales](#implementaciones-adicionales)
    * [Controles adicionales](#controles-adicionales)
* [Animación del juego](#animación-del-juego)
* [Referencias](#referencias)
    * [Material](#material)
    * [Guías y ayuda](#guías-y-ayuda)

## Autoría

Esta obra es un trabajo realizado por Benearo Semidan Páez para la asignatura de Creación de Interfaces de Usuario cursada en la ULPGC.

## Introducción

El objetivo de esta práctica consiste en implementar un sistema planetario en Processing. En ella se establece como requisito que incluya:

- Al menos una estrella
- Al menos 5 planetas
- Al menos un satélite
- Imágenes y texto


## Controles

| Acción | Resultado |
| -- | -- |
| Arrastrar con el <i>click</i> izquierdo | Mueve el sistema planetario |
| Arrastrar con el <i>click</i> izquierdo | Rota el sistema planetario |
| Girar rueda del ratón | Realiza zoom |
| Pulsar la tecla [R] | Restaura el sistema al estado por defecto |

## Implementación base

El elemento principal de la implementación base es la clase abstarcta <i>CelestialBody</i>, de la cual extiendes las estrellas, los planetas y los satélites.

### Definición de la estructura

```java
abstract class CelestialBody {
  private float diameter;
  private float rotationAngle = 0;
  private float translationAngle = 0;
  private float rotationFrequency;
  private float translationFrequency;
  private PImage texture;

  // Non-translatable celestial bodies
  public CelestialBody(float diameter, float rotationFrequency, String texture) {
    this.diameter = diameter;
    this.rotationFrequency = rotationFrequency;
    this.texture = (texture != null && texture != "") ? loadImage(texture) : null;
  }

  // Translatable celestial bodies
  public CelestialBody(float initialAngle, float diameter, float rotationFrequency, float translationFrequency, String texture) {
    translationAngle = initialAngle % 360;
    this.diameter = diameter;
    this.rotationFrequency = rotationFrequency;
    this.translationFrequency = translationFrequency;
    this.texture = (texture != null && texture != "") ? loadImage(texture) : null;
  }
}  
```

Adicionalmente, cada instancia de <i>CelestialBody</i> específica tiene su propia implementación de <b>void display()</b>, que se encarga de renderizar el objeto en cuestión.

### Traslación de los objetos

Para la traslación de los planetas/satélites se realiza de la siguiente manera:

```java
float distance = distanceToStar + parent.getDiameter() + super.diameter/2;
translate(distance * cos(radians(super.translationAngle)), 0, distance * sin(radians(super.translationAngle)));
```

## Implementaciones adicionales

### Controles adicionales

De manera opcional, se incluyen todos los distintos [controles](#controles) mencionados anteriormente, que permiten una visualización más cómoda del sistema representado.

## Animación del juego
![GIF](animation/animation.gif)

## Referencias

### Material

<b>[[Texturas - Fuente 1]](https://www.solarsystemscope.com/textures/)</b>

<b>[[Texturas - Fuente 2]](https://www.artstation.com/sanwal_af/albums/all)</b>

### Guías y ayuda

<b>[[Referencia de Processing]](https://processing.org/reference/)</b>
