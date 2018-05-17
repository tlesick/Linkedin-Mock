class Connection < ActiveRecord::Base
  belongs_to :user, :foreign_key => 'peer_id'
  belongs_to :user, :foreign_key => 'user_id'
end
