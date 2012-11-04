#!/usr/bin/env ruby

require 'nokogiri'
require 'fileutils'
require 'pdfkit'
require 'nori'


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
		Nori.parser = :nokogiri

		output = []
		doc   = Nori.parse(File.read('resume.xml'))

		resume = doc["resume"]
		personal = resume["personal"]

		output << personal["name"]
		output << %(#{personal["address"]} | #{personal["phone"]} | #{personal["email"]})


		output << personal["urls"]["url"].join(" | ")
		output << ""

		resume["section"].each do |s|
			output << s["name"]+"\n"

			s["subsection"].each do |ss|
				line = []
				line << ss["name"] if ss["name"]
				line << ss["location"] if ss["location"]
				line << ss["time"] if ss["time"]
				output << line.join(", ")

				output << "-----------------------------------------------------------------"

				line = []
				ss["description"].each do |k,v|
					if k == "p"
						line << v
						line << ""
					elsif k == "ul"
						v["li"].each do |li|
							line << "* " + li
						end
						line << ""
					end
						
						
				end
				output += line
			end
			output << "=================================================================\n"
		end

		f = File.open("output/resume.txt", "w") do |file|
			file.puts output.join("\n")
		end			
	end
	
end
