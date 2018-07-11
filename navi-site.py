#!/usr/bin/python
# -*- coding: utf-8 -*-

from bottle import route, run, template, view, static_file
from bottle import post, get, request, redirect
import bottle

bottle.debug(True)

PORT=2703
static_file_verion=1000

universal_ROUTE_dict = {
    'static_file_version': static_file_verion,
}

### static files
@route('/<filename>')
def server_static(filename):
    return static_file(filename, root='./static')

@route('/css/<filename>')
def server_static_css(filename):
    return static_file(filename, root='./static/css')

@route('/img/<filename>')
def server_static_img(filename):
    return static_file(filename, root='./static/img')

@route('/')
@view('index')
def index():
    return dict(universal_ROUTE_dict)

run(host='0.0.0.0', port=PORT, server='paste')