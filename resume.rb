#!/usr/bin/env ruby
require 'nokogiri'
require 'fileutils'
require 'pdfkit'
module Resume
	def build_html
		
		doc   = Nokogiri::XML(File.read('resume.xml'))
		xslt  = Nokogiri::XSLT(File.read('resume.xsl'))


		output = xslt.transform(doc)

		FileUtils.mkdir_p "output"
		f= File.open("output/resume.html", "w") do |file|
			file.puts output
		end
	end
	
	def build_pdf
		build_html
		k = PDFKit.new(File.read('output/resume.html'),page_size: "Letter", margin_top:"0.5in",margin_bottom:"0.3in",margin_left:"0.1in",margin_right:"0.1in")

		f = File.open("output/resume.pdf", "w") do |file|
			file.puts k.to_pdf
		end	
	end

	def build_ascii
		
	end
	
end
