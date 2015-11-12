module PagesHelper
  def button_label(pack, organisation)
    result = 'Buy ' + pack.name + ' (' + number_to_currency(pack.member_price) + ')'
  end
end
