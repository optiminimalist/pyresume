#!/usr/bin/env ruby

# require 'xml/xslt'

# XML::XSLT.registerErrorHandler { |string| puts string }

# xslt = XML::XSLT.new()
# xslt.xml = "resume.xml"
# xslt.xsl = "resume.xsl"

# out = xslt.serve()

# f= File.open("output/resume.html", "w") do |file|
# 	file.puts out
# end
require 'nokogiri'
doc   = Nokogiri::XML(File.read('resume.xml'))

xslt  = Nokogiri::XSLT(File.read('resume.xsl'))


output = xslt.transform(doc)

f= File.open("output/resume.html", "w") do |file|
	file.puts output
end