#!/usr/bin/python
# -*- coding: utf-8 -*-

from bottle import route, run, template, view, static_file
from bottle import post, get, request, redirect

PORT=2703

@route('/')
def index():
    return "the navi-site is coming soon..."

run(host='0.0.0.0', port=PORT, server='paste')