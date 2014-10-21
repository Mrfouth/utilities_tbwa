Given /^utilities_tbwa is already installed$/ do
  install_utilities_tbwa
end

Given /^I install utilities_tbwa to "([^"]*)"$/ do |path|
end

Then /^the sass directories(?: with "([^"]+)" prefix)? should have been generated$/ do |prefix|
  sass_directories = ["utilities_tbwa"]
  sass_directories.map!{ |directory| utilities_tbwa_path(prefix, directory) }
  check_directory_presence(sass_directories, true)
end

Then /^utilities_tbwa should not have been generated$/ do
  check_directory_presence(['utilities_tbwa'], false)
end

Then /^the output should contain the current version of UtilitiesTbwa$/ do
  step %(the output should contain exactly "UtilitiesTbwa #{UtilitiesTbwa::VERSION}\n")
end
