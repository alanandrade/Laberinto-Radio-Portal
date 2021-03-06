class Program < ActiveRecord::Base
	has_attached_file	:logo, styles: {:small =>	"80x80#",:large	=> ">240x240"}
	
	has_many	:schedules,	:dependent	=>	:destroy
	has_many	:days,				through: :schedules
	has_many	:ownerships,	autosave: true
	has_many	:broadcasters,	through: :ownerships , autosave: true, uniq: true
	#has_one		:admin,	class_name: "Broadcaster", conditions: {ownerships: {admin: true}}

	validates_uniqueness_of :name

	after_save :set_admin
	
	def form_schedules=(f_schedules)
		selected_days		= f_schedules[:day_ids].map{|day| day.first.to_i}
		existing_days		=	schedules.map(&:day_id)
		days_to_delete	=	existing_days - selected_days		
		# If day does not exsists yet.
		selected_days.each do |day|
			schedules.build(day_id: day) unless existing_days.include?(day)
		end
		
		schedules.where(day_id: days_to_delete).each do |to_die|
			to_die.destroy
		end if days_to_delete.any?		
						
	end	
	def form_schedules;end

	private
	def set_admin
		ownerships.first.update_attribute(:admin,true) if broadcasters.length == 1
	end
end
