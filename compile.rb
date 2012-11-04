#!/usr/bin/env ruby


require 'nokogiri'

doc   = Nokogiri::XML(File.read('resume.xml'))
xslt  = Nokogiri::XSLT(File.read('resume.xsl'))


output = xslt.transform(doc)

f= File.open("output/resume.html", "w") do |file|
	file.puts output
end