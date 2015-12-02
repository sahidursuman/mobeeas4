class OpportunityMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.opportunity_mailer.invited.subject
  #
  def invited(opportunity_id, profile_id)
    @opportunity = Opportunity.find(opportunity_id)
    @profile = Profile.find(profile_id)
    mail(to: "kfatiguso@gmail.com", subject: 'You have been invited to participate in MOBEEAS Opportunity')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.opportunity_mailer.accepted.subject
  #
  def accepted(opportunity_id, profile_id)
    @opportunity = Opportunity.find(opportunity_id)
    @profile = Profile.find(profile_id)
    mail(to: "kfatiguso@gmail.com", subject: 'A Candidate has accepted your invitation to participate in MOBEEAS Opportunity')
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.opportunity_mailer.assigned_a_token.subject
  #
  def assigned_a_token(opportunity_id, profile_id)
    @opportunity = Opportunity.find(opportunity_id)
    @profile = Profile.find(profile_id)
    mail(to: "kfatiguso@gmail.com", subject: 'Your engagement in MOBEEAS Opportunity has been confirmed')
  end
end
