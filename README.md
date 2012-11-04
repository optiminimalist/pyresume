XML-Resume
==========

A simple way to specify a resume in XML and convert it to multiple formats. At the moment, HTML and PDF are support. Plain text is in the works!

Modify the resume
-----------------

Just open the file
	resume.xml

The tags should be straight-forward to understand and change.

Build the resume
----------------

First install dependencies
	bundle install

and then simply run the rake task
	rake resume:build

This will create an output folder containing the finished resume.