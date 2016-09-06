#!/usr/bin/ruby

ALIAS = 'pp'

content = File.read("/Users/#{ENV['USER']}/.#{ENV['SHELL'].split('/').last}rc")
if !content.include?('#Ppwd_marker') || !content.include?('#Pend_of_pwd_marker')
  content << "alias #{ALIAS}=\"ruby #{File.expand_path(File.dirname(__FILE__) + '/current_directory.rb')}\""
  content << "\n#Ppwd_marker\n"
  content << "cd #{ENV['PWD']}"
  content << "\n#Pend_of_pwd_marker\n"
end
File.write(
  "/Users/#{ENV['USER']}/.zshrc",
  content.gsub(
    /(Ppwd_marker\n)(.*)(\n#Pend_of_pwd_marker)/,
    '\1' + "cd #{ENV['PWD']}" + '\3'
  )
)
