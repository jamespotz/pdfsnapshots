class PdfMailer < ApplicationMailer
	def send_pdf(snapshot)
		@snapshot = snapshot
		@pdf = @snapshot.to_pdf
		@snapshot.reload
		attachments["PDFSnapshot#{ Date.today.iso8601 }.pdf"] = {
			mime_type: 'application/pdf',
			content: open(@snapshot.pdf.expiring_url).read}
		mail(
			to: @snapshot.email_address,
			subject: "Thank You for using PDFSnapshot")
	end
end
