# dependant-docker-stack

This bash script allows you to control multiple docker-compose files as if it was just one file,
while preserving the order of the files. This might come in handy in cases such as:

* you have a traefik and you want to use its labels on other containers, which are in different compose files
* you have a private docker registry and you want to use images stored in it in different compose files
* you have other dependency which requires some container to be running before attempting something esle and "depends_on" does not cover your use case

Disclaimer:
this is the first bash function I ever wrote and it supports only my use-cases for now. If you are interested in extending it,
please, do not hesitate to contact me or prepare a pull request, I will be glad if this got improved.
