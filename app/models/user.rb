class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :profile_picture, :styles => { :small => "150x150>" },
                :url  => "/assets/products/:id/:basename.:extension",
                :path => ":rails_root/public/assets/products/:id/:basename.:extension"
  validates_attachment_size :profile_picture, :less_than => 5.megabytes
  validates_attachment_content_type :profile_picture, :content_type => ['image/jpeg', 'image/png']
  validates :first_name, :format => { :with => /\A[A-Za-z ][A-Za-z ]*\z/,:message => "Only letters allowed" }, :allow_blank => true,:uniqueness => true
  validates :first_name, :length => { :in => 3..25 }
  validates :last_name,  :format => { :with => /\A[a-zA-Z ][a-zA-Z ]*\z/,:message => "Only letters allowed"}
  validates :last_name,  :length => { :in => 3..25 }
  validates :username,   :format => { :with => /\A[a-zA-Z ][a-zA-Z ]*\z/,:message => "Only letters allowed"}
  validates :username,   :length => { :in => 3..25 }
  validates :email,      :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,4})\Z/ }

  enum status: [:active, :block]


  def admin?
  	admin
  end

end