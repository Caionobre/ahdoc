class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :registerable, :recoverable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  # default password
  FAKE_PASSWORD = '******'.freeze

  validates :name, :presence => true,
                   :uniqueness => {:allow_blank => true},
                   :length => {:maximum => 255, :allow_blank => true}

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  def to_s
    name.to_s
  end

  def password
    @password || (persisted? ? FAKE_PASSWORD : nil)
  end

  def password=(password)
    super unless password == FAKE_PASSWORD
  end

  def password_confirmation
    @password_confirmation || (persisted? ? FAKE_PASSWORD : nil)
  end

  def password_confirmation=(password_confirmation)
    @password_confirmation = password_confirmation unless password_confirmation == FAKE_PASSWORD
  end
protected
  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end
end