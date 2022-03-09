# `request`

Para aquellos *scripts* que se ejecutan de forma interactiva, a veces es necesario que el usuario proporcione algún tipo de información que el *script* requiere.

El objetivo de este *script* es solicitar la entrada de datos por parte del usuario.

Para facilitar la entrada (generalmente, algún tipo de dato simple), se proporciona un valor por defecto (de manera opcional).

## Uso

El *script* acepta dos parámetros; el primero se interpreta como el mensaje personalizado que se muestra al usuario al solicitar la entrada de datos. El segundo es el valor por defecto que *devuelve* el *script* si el usuario no proporciona ninguna entrada.

El *script* no valida el número de parámetros ni realiza ninguna comprobación sobre el dato introducido por el usuario.

## Versión *sensitive*

En `request_sensitive.sh` se encuentra una versión actualizada de la función `request` que acepta el *flag* adicional `-s` o `--sensitive`, que hace que no se muestre en pantalla la entrada del usuario (por ejemplo, para contraseñas, etc).
