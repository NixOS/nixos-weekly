# -*- coding: utf-8 -*- #

from livereload import Server, shell
from pelican import Pelican
from pelican.settings import read_settings


settings = read_settings('pelicanconf.py')
settings['WITH_FUTURE_DATES'] = True

p = Pelican(settings)


def compile():
    try:
        p.run()
    except SystemExit as e:
        pass


def compile_theme():
    delete_outputdir = p.delete_outputdir
    p.delete_outputdir = True
    compile()
    p.delete_outputdir = delete_outputdir


def compile_all():
    global p
    p = Pelican(read_settings('pelicanconf.py'))
    compile_theme()


server = Server()
server.watch('content/', compile)
server.watch('theme/', compile_theme)
server.watch('pelicanconf.py', compile_all)
server.serve(root='output')
