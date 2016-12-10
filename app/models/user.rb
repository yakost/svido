class User < ActiveRecord::Base
  has_many :sent_feedbacks,     :class_name => 'Feedback',  :foreign_key => 'sender_id'
  has_many :received_feedbacks, :class_name => 'Feedback',  :foreign_key => 'receiver_id'
  has_many :sent_questions,     :class_name => 'Question',  :foreign_key => 'sender_id'
  has_many :received_questions, :class_name => 'Question',  :foreign_key => 'receiver_id'

  mount_uploader :avatar, AvatarUploader
  has_many :products
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable,
         omniauth_providers: [:facebook, :google_oauth2]


  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def full_name
     "#{first_name} #{last_name}"
  end

  def set_default_role
    self.role ||= :user
  end

  def self.find_from_social_registrations_oauth(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:provider => access_token.provider, :uid => access_token.uid ).first
    if user
      return user
    else
  	  registered_user = User.where(:email => access_token.info.email).first
      if registered_user
        return registered_user
      else
        user = User.create(
        first_name: data["first_name"],
        last_name: data["last_name"],
        provider:access_token.provider,
        email: data["email"],
        uid: access_token.uid ,
        password: Devise.friendly_token[0,20],
        )
      end
    end
  end


end
