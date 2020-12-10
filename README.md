# dependant-docker-stack

This bash script allows you to control multiple docker-compose files as if it was just one file,
while preserving the order of the files. This might come in handy in cases such as:

* you have a traefik and you want to use its labels on other containers, which are in different compose files
* you have a private docker registry and you want to use images stored in it in different compose files
* you have other dependency which requires some container to be running before attempting something esle and "depends_on" does not cover your use case

## Prerequisites:

have your docker-compose files in the following format:

````
docker-compose-[NUMBER]-[LABEL].yml
````

Examples:

````
docker-compose-1-essential.yml
docker-compose-2-dependent.yml
````

## Installation:

1) copy docker-stack.sh contents into arbitrary file (I use ``~/.docker.stack.sh``)
2) make the file executable by running ``chmod +x ~/.docker-stack.sh``
3) load your function into shell ``source ~/.docker-stack.sh``
4) you can now use ``docker-stack`` commands in your terminal

## Usage:

``docker-stack up``

- runs ``docker-compose -f [filename] up -d`` on every compatible (see Prerequisites section) file in the current directory.
The files are run in ascending order based on [NUMBER]
(``docker-compose-1-crucial.yml`` is executed BEFORE ``docker-compose-2-not-so-crucial.yml`` and so on)


``docker-stack down``

- runs ``docker-compose -f [filename] down`` on every compatible (see Prerequisites section) file in the current directory.
The files are run in descending order based on [NUMBER]
(``docker-compose-1-crucial.yml`` is executed AFTER ``docker-compose-2-not-so-crucial.yml`` and so on)


``docker-stack pull``

- runs ``docker-compose -f [filename] pull`` on every compatible (see Prerequisites section) file in the current directory.
The files are run in ascending order based on [NUMBER]
(``docker-compose-1-crucial.yml`` is executed BEFORE ``docker-compose-2-not-so-crucial.yml`` and so on)


``docker-stack prune``

- runs ``docker-system prune``. This is not run on any specific file as it is docker-system-wide command.
I plan to implement it more safely in the future by traversing the files in given order as well.

## Disclaimer:

this is the first bash function I ever wrote and it supports my use-cases for now. If you are interested in extending it,
please, do not hesitate to contact me or prepare a pull request, I will be glad if this got improved.
