require File.join(File.dirname(__FILE__), "resume.rb")

namespace :resume do
  desc "build the resume versions"
  task :build do
    include Resume
    build_pdf
    build_ascii
  end

  
end
