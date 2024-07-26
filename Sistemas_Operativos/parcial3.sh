#!/bin/bash
echo -n "Ingrese el nick de juego: "
read nombre
echo -n "Ingrese la palabra a adivinar para su contrincante: "
read palabra
total_letras=${#palabra}
total_intentos=6
intentos_restantes=$total_intentos
letras_adivinadas=()
#al nosotros usar gt- 0 hacemos que nuestro bucle while siga ejecutandose hasta que llegue a 6 de esa manera definimos 6 intentos
while [ $intentos_restantes -gt 0 ] && [ ${#letras_adivinadas[@]} -lt $total_letras ]; do
    echo -n "Ingrese una letra: "
    read letra
#Al usar el comando tr hacemos que todas las palabras ingresadas se vuelvan minusculas
    letra=$(echo "$letra" | tr '[:upper:]' '[:lower:]')
    if [[ " ${letras_adivinadas[@]} " == *" $letra " ]]; then
        echo "Ya has adivinado la letra '$letra'. Intenta con otra letra."
        continue
    fi
    if [[ $palabra == *$letra* ]]; then
        letras_adivinadas+=("$letra")
        echo "¡Correcto La letra '$letra' está en la palabra."
    else
        ((intentos_restantes--))
        echo "Incorrecto. La letra '$letra' no está en la palabra. Te quedan $intentos_restantes intentos."
    fi
done
#El -eq  se encarga de  verificar si el numero de comparar que el numero de letras adivinadas sea el total de letras de la palabra
if [ ${#letras_adivinadas[@]} -eq $total_letras ]; then
    echo -e "\n¡Felicitaciones Has adivinado la palabra '$palabra' correctamente."
else
    echo -e "\n¡Lo siento Se te acabaron los intentos. La palabra era '$palabra'."
fi
