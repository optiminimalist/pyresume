import lxml.etree as ET
from subprocess import call
import sys

XML_FILENAME = "./data/resume.xml"
XSL_FILENAME = "./template/resume.xsl"
OUTPUT_DIR = "./output"

def generate_html():
	dom = ET.parse(XML_FILENAME)
	xslt = ET.parse(XSL_FILENAME)
	transform = ET.XSLT(xslt)
	newdom = transform(dom)

	with open("%s/resume.html" % OUTPUT_DIR, 'w') as f:
		f.write(ET.tostring(newdom, pretty_print=True).decode('utf-8'))

def generate_pdf():
	cmd = [
		'wkhtmltopdf',
		'--quiet',
		'--page-size', 'Letter',
		'--margin-top', '0.5in',
		'--margin-right', '0.1in',
		'--margin-bottom', '0.3in',
		'--margin-left', '0.1in',
		'--encoding', 'UTF-8',
		'%s/resume.html' % OUTPUT_DIR,
		'%s/resume.pdf' % OUTPUT_DIR,
	]

	call(cmd)

if __name__ == "__main__":
	if len(sys.argv) == 1:
		print("Please provide an output format from [html, pdf]")

	if sys.argv[1] == "html":
		generate_html()
	elif sys.argv[1] == "pdf":
		generate_pdf()
	else:
		print("Unrecognized output format")		
