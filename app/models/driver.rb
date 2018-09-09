class Driver < ApplicationRecord
	validates :name, :dob, :phone, :license_plate, presence: true
	validates :phone, length: { minimum: 10, too_short: "is not valid" }
	validates :phone, numericality: { only_integer: true, message: "must be a number" }
	validates :phone, :license_plate, uniqueness: true
	validate :unique_email

	validates :image_url, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i, 
		message: 'must be a URL for GIF, JPG or PNG image.'
	}

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
		:recoverable, :rememberable, :validatable


	attr_accessor :image

	after_save :save_image, if: :image

	def save_image
		filename = image.original_filename
		folder = "public/driver_profile_image"

		FileUtils::mkdir_p folder

		f = File.open File.join(folder, filename), "wb"
		f.write image.read()
		f.close

		self.image = nil
		update image_url: filename
		
	end


	private
		def unique_email
			errors.add(:email, 'has already been taken') unless User.where(email: self.email).blank?
		end
end
