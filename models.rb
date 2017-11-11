# Models

# ActiveRecord classes go here. These are object-model
# representations of your database tables. All classes defined
# here must inherit from ActiveRecord::Base

 class User < ActiveRecord::Base
   has_many :comments
   # validates :f_name, presence: true
 end

 class Comment < ActiveRecord::Base
   belongs_to :user
 end
