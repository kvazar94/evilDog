# frozen_string_literal: true

namespace :ads_change_states do
  desc 'подтвердить'
  task ads_publish: :environment do
    ads = Advertisement.approved
    ads.update(state: 'published')
  end

  desc 'в архив'
  task ads_archive: :environment do
    ads = Advertisement.published.where('updated_at >= ?', 3.days) # updated_at: 3.days.ago..Time.now)
    ads.update(state: 'archived')
    puts ads
  end
end
