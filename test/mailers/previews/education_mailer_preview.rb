# Preview all emails at http://localhost:3000/rails/mailers/education_mailer
class EducationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/education_mailer/notify
  def notify
    EducationMailer.notify
  end

  # Preview this email at http://localhost:3000/rails/mailers/education_mailer/approved_by_admin
  def approved_by_admin
    EducationMailer.approved_by_admin
  end

end
