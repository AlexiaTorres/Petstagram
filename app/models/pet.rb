class Pet < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable

  acts_as_birthday :birthday

  validates :email, presence: true
  has_attached_file :avatar, styles: { medium: '400x400#', thumb: '200x200#' }, default_url: ':style/avatar.jpg'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :avatar, matches: [/png\z/, /jpe?g\z/, /JPE?G\z/]
  validates_attachment_size :avatar, in: 0..3.megabytes

end
