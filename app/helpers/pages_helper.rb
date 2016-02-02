module PagesHelper
  def button_label(pack)

  # This is the original def header, do not delete, for reference
  # def button_label(pack, organisation)

    result = 'Buy ' + pack.name + ' (' + number_to_currency(pack.member_price) + ')'
  end

end
