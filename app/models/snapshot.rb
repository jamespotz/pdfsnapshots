require 'tempfile'
require 'uri'
class Snapshot < ActiveRecord::Base
	before_validation :auto_fix_url
	validates_presence_of :url
	validates_presence_of :email
	has_attached_file :pdf,
						storage: :fog,
						fog_credentials: {
							aws_access_key_id: ENV["GOOGLE_KEY_ID"],
							aws_secret_access_key: ENV["GOOGLE_SECRET_KEY"],
							provider: 'Google'},
						fog_directory: "pdf_snapshots"
	validates_attachment :pdf, :content_type => { :content_type => "application/pdf"}

	def is_valid_uri?
		request               = Net::HTTP.new(parsed_url.host, parsed_url.port)
		request.use_ssl       = (parsed_url.scheme == 'https')
		response              = request.request_head(parsed_url)
		return true if response.code != '404'
	end	

	def to_pdf
		self.pdf = PdfGenerator.new(self.url).create
		self.pdf_file_name = "#{ parsed_url.host.gsub('.','') }.pdf"
	end

	def send_pdf
		PdfMailer.delay.send_pdf(self)
	end

	private

		def parsed_url
			URI.parse(self.url)
		end

		def auto_fix_url
			unless self.url[/\Ahttps:\/\//] || self.url[/\Ahtpp:\/\//]
				self.url = "http://#{ self.url }"
			end
		end
end
