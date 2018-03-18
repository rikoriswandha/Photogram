class User < ApplicationRecord
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 }, format: { with: /\A[a-zA-Z0-9]+\Z/, message: 'only letters and numbers allowed' }
  validates_uniqueness_of :user_name, message: 'username has already taken'
  validates_uniqueness_of :email, message: 'email has already registered'
  validates_uniqueness_of :user_name, case_sensitive: false, message: 'only lowercase letters allowed'
  has_many :posts, dependent: :destroy
  has_attached_file :avatar, styles: { medium: '152x152#' }
  validates_attachment_content_type :avatar, content_type: /\Aimage/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :comments, dependent: :destroy
end