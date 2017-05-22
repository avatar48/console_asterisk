class Phone < ActiveRecord::Base
	belongs_to :context
	belongs_to :status
	# validates :number, :password, :callerid, :context_id, presence: true
	validates :number, :password, :callerid, :callgroup, :context_id, :pickupgroup, presence: { message: "должен быть заполнен" }
	validates :number,:callgroup, :context_id, :pickupgroup, numericality: { only_integer: true, message: "не является числом"}
# validates_format_of :callerid, :with => /\A[a-z0-9_\+-]+(\.[a-z0-9_\+-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.([a-z]{2,4})(\s*,\s*[a-z0-9_\+-]+(\.[a-z0-9_\+-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.([a-z]{2,10}))*\Z/, :allow_blank => true	 	 	
# validates_format_of :aliases, :with => /^[a-z0-9_\+-]+(\.[a-z0-9_\+-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.([a-z]{2,4})(\s*,\s*[a-z0-9_\+-]+(\.[a-z0-9_\+-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*\.([a-z]{2,4}))*$/, :allow_blank => true	
	 delegate :name, to: :context 
	 delegate :name, to: :status
	  before_create do
    	self.status_id = 1
  	  end
	def allowed_contexts
 	 Context.all
	end

end
