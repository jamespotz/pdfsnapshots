class PdfGenerator
	attr_reader :url
	def initialize(url)
		@url = url
	end

	def create
		new_pdf = WickedPdf.new.pdf_from_url(url)
		pdf 	= StringIO.new(new_pdf)
	end
end