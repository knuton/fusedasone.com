require 'jekyll'
require 'tmpdir'

REPO = "knuton/fusedasone.com"

namespace :site do
  desc "Generate blog files"
  task :generate do
    Jekyll::Site.new(Jekyll.configuration({
      "source"      => ".",
      "destination" => "_site"
    })).process
  end


  desc "Generate and publish blog to gh-pages"
  task :publish => [:generate] do
    Dir.mktmpdir do |tmp|
      cp_r "_site/.", tmp
      Dir.chdir tmp
      system "git init"
      system "git add ."
      message = "Add site build from #{Time.now.utc}"
      system "git commit -m #{message.shellescape}"
      system "git remote add origin git@github.com:#{REPO}.git"
      system "git push origin master:refs/heads/gh-pages --force"
    end
  end

end
