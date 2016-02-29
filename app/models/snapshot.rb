require 'tempfile'
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
		host_name = URI.parse(self.url)
		host_name = host_name.host.gsub('.','')
		temp_pdf_file = Tempfile.new(["#{host_name}", ".pdf"],Rails.root.join('tmp/pdfs'))
		temp_pdf_file.binmode
		temp_pdf_file.write pdf
		temp_pdf_file.close
		self.snapshot_link = temp_pdf_file.path
	end
end
