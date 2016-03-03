class User < ActiveRecord::Base
  rolify
  before_save { generate_token(:auth_token) }

  validates :uid,
            :provider,
            :first_name,
            :last_name,
            :email, presence: true

  scope :has_role, lambda{|role| includes(:roles).where(:roles => { :name => role})}

  def name
    %W[#{first_name} #{last_name}].join(" ")
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  # def self.from_omniauth(auth)
  #   user = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
  #   user.provider = auth.provider
  #   user.uid = auth.uid
  #   user.first_name = auth.info.first_name
  #   user.last_name = auth.info.last_name
  #   user.email = auth.info.email
  #   user.save!
  # end

  def self.omniauth(auth)
    user = find_or_create_by(uid: auth['uid'], provider: auth['provider'])
    user.provider = auth.provider
    user.uid = auth.uid
    user.first_name = auth.info.first_name
    user.save!
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

end
