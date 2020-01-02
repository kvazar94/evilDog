class Advertisement < ApplicationRecord
	mount_uploader :image, ImageUploader

	belongs_to :user
	belongs_to :category
	validates :title, :body, presence: true

	state_machine initial: :draft do
		state :fresh
		state :draft
		state :rejected
		state :approved
		state :published
		state :archived

		event :to_fresh do
			transition :draft => :fresh
		end

		event :to_archive do
			transition :published => :archived
		end

		event :reject do
			transition :fresh => :rejected
		end

		event :approve do
			transition :fresh => :approved
		end

		event :to_published do
			transition :approved => :published
		end

		event :to_draft do
			transition [:rejected, :archived] => :draft
		end

	end

	attr_accessor :state_event
	after_save :trigger_state, if: :state_event

	def change
		a = Advertisement.with_state(:approved)
		a.to_published
	end

	private def trigger_state
		send(state_event) if send(:"can_#{state_event}?")
	end


end
