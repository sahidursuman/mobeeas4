# Preview all emails at http://localhost:3000/rails/mailers/opportunity_mailer
class OpportunityMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/opportunity_mailer/invited
  def invited
    OpportunityMailer.invited
  end

  # Preview this email at http://localhost:3000/rails/mailers/opportunity_mailer/accepted
  def accepted
    OpportunityMailer.accepted
  end

  # Preview this email at http://localhost:3000/rails/mailers/opportunity_mailer/assign_a_token
  def assign_a_token
    OpportunityMailer.assign_a_token
  end

end
