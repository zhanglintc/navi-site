#!/usr/bin/python
# -*- coding: utf-8 -*-

from bottle import route, run, template, view, static_file
from bottle import post, get, request, redirect
import bottle
import json

bottle.debug(True)

PORT=2703
static_file_verion=1000

JSON_DB_FILE = "sites.json"

universal_ROUTE_dict = {
    'static_file_version': static_file_verion,
}

### static files
@route('/<filename>')
def server_static(filename):
    return static_file(filename, root='./static')

@route('/js/<filename>')
def server_static_js(filename):
    return static_file(filename, root='./static/js')

@route('/css/<filename>')
def server_static_css(filename):
    return static_file(filename, root='./static/css')

@route('/img/<filename>')
def server_static_img(filename):
    return static_file(filename, root='./static/img')

@route('/layer/<filename:path>')
def server_static_img(filename):
    return static_file(filename, root='./static/layer')

@route('/')
@view('index')
def index():
    try:
        fr = open(JSON_DB_FILE, "rb")
        sites_json = fr.read()
        fr.close()
        sites_dict = json.loads(sites_json)
    except:
        fw = open(JSON_DB_FILE, "wb")
        fw.close()
        sites_json = "{}"

    sites_dict = json.loads(sites_json)
    sites_dict = {"sites_dict": sites_dict}
    return dict(universal_ROUTE_dict, **sites_dict)

@route('/layer_edit')
@view('layer_edit')
def index():
    return dict(universal_ROUTE_dict)

@post('/update_site_dict')
def update_site_dict():
    sn = request.forms.get('sn', None)
    name = request.forms.get('name', None)
    site = request.forms.get('site', None)

    try:
        fr = open(JSON_DB_FILE, "rb")
        sites_json = fr.read()
        fr.close()
        sites_dict = json.loads(sites_json)
    except:
        sites_json = "{}"

    sites_dict = json.loads(sites_json)
    sites_dict[sn] = [name, site]
    sites_json = json.dumps(sites_dict, indent=4)

    fw = open(JSON_DB_FILE, "wb")
    fw.write(sites_json)
    fw.close()

    return "OK"

run(host='0.0.0.0', port=PORT, server='paste')