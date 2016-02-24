class SponsorshipMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.sponsorship_mailer.expression_of_interest.subject
  #
  def expression_of_interest(sponsor_id, opportunity_id)
    @opportunity = Opportunity.find(opportunity_id)
    @sponsor = Sponsor.find(sponsor_id)
    mail(to: 'mobeeas@mobeeas.com', subject: 'Expression of Interest')
  end
end
