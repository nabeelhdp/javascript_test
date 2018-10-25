
import json
from bottle import route, run, template, static_file, request
import socket

@route('/static/:path#.+#', name='static')
def static(path):
    return static_file(path, root='static')

@route('/table')
def serve_homepage():
    return template('disp_table',pgnames = name, dataparam = bytesQueued, cases = len(name))

@route('/pie', method=['POST','GET'])
def serve_pie():
    if (request.forms.get('pgid')) :
      label = request.forms.get('pgid')
    else :
      label = "root"

    print "Label is %s" % label
    return template('pie_dummy', label = label)

run(host=socket.getfqdn(), port=8080, debug=True)
