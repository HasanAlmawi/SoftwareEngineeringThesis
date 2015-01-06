#!/soft/python-2.7/bin/python

import cgi
import cgitb
cgitb.enable()  # for troubleshooting

#print header
print "Content-type: text/html"
print
print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
print "<!DOCTYPE html>"
print "<html>"
print "<head>"
print "<title>Form Accepted</title>"
print "</head>"
print "<body>"
print "<p>Thank you.</p>"
print "</body>"
print "</html>"
