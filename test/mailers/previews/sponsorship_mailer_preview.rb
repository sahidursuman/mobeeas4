# Preview all emails at http://localhost:3000/rails/mailers/sponsorship_mailer
class SponsorshipMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/sponsorship_mailer/expression_of_interest
  def expression_of_interest
    SponsorshipMailer.expression_of_interest
  end

end
