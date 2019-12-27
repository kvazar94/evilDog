namespace :advertisements do

task :ads_publish => :environment  do
	ads = Advertisement.change
	
end

task :ads_archiv => :environment do
	ads = Advertisement
end
end