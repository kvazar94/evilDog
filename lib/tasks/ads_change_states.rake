namespace :ads_change_states do
	desc 'жалкая попытка'
	task ads_publish: :environment  do
		ads = Advertisement.where("state = 'approved'")
		ads.update(:state => 'published')
	end

	task ads_find: :environment  do
		ads = Advertisement.where("state = 'approved'")
		puts ads

	end
end
