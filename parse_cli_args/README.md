# Parsing CLI arguments

> Este *Script* está pensado como *referencia*, no como una función a importar en otros *scripts*. Cada *script* requiere sus propio conjunto de variables, por lo que se proporciona un parámetro de cada tipo como ejemplo.

Un problema habitual a la hora de crear scripts en BASH es el procesado de los parámetros proporcionados desde la línea de comandos.

El objetivo es poder facilitar los parámetros al script en cualquier orden.

En general, tenemos tres tipos de parámetros:

- parámetros posicionales
- *flags*
- parámetros de clave-valor

## Parámetros posicionales

Ej: `touch 1 2 3`, genera tres ficheros: fichero "1", fichero "2" y fichero "3". Este tipo de parámetros es equivalente a ejecutar los comandos `touch 1`, `touch 2` y `touch 3`.

## *Flags*

Son parámetros que en el caso de estar presentes, modifican el comportamiento *por defecto* del script. Por ejemplo, `touch -a 1 2 3` no crea los ficheros, sino que modifica la última vez que se accedió a los ficheros.

## Parámetros de clave-valor

También se suelen llamar *named parameters* (parámetros con nombre); por ejemplo `--color amarillo`. Usamos espacios para separar el nombre del parámetro del valor del mismo.

## Ejemplo

```bash
./script.sh 1 -a 2 --key-value-arg amarillo 3 4
```

O cualquier otra combinación (de formas *cortas* y *largas* de los parámetros y *flags*):

```bash
./script.sh 1 2 --key-value-arg amarillo 3 4 -a 
```

El script recibe los argumentos ordenados:

```bash
./script.sh 1 2 3 4 -a --key-value-arg amarillo
```

### Parámetros como *array*

El *script* devuelve los parámetros posicionales como un *string*; si queremos que se devuelvan como un *array* de parámetros, podemos usar:

```bash
function parse_cli_args () {
    PARAMS=()

    while (( "$#" ))
    do
        case "$1" in
            -s|--sensitive)
                SENSITIVE="yes"
                shift
                ;;
            -*|--*=) # Unsupported flags
                echo "Error: Unsupported flag $1" >&2
                exit 1
                ;;
            *) # Preserve positional arguments
                PARAMS+=("$1")
                shift
                ;;
        esac
    done

    # Set positional arguments in their proper place
    eval set -- "$PARAMS"
}
```

De esta forma, podemos acceder a los diferentes elementos a través de `"${PARAMS[0]}"`, etc...
