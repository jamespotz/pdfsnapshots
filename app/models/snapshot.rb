class Snapshot < ActiveRecord::Base
	validates_presence_of :url
	def is_valid_uri?
		url = URI.parse(self.url)
		request = Net::HTTP.new(url.host, url.port)
		request.use_ssl = (url.scheme == 'https')
		response = request.request_head(url)
		true if response.code != '404'
	end

	def generate_pdf
		pdf = WickedPdf.new.pdf_from_url(self.url)
		pdf_dir = Rails.root.join('tmp/pdfs',"#{self.url}.pdf")
		File.open(pdf_dir, 'wb') do |file|
			file.write pdf
		end
	end
end
