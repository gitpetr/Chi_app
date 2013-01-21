# encoding: UTF-8
class AddDefaultAddress < ActiveRecord::Migration
  def up
    # Error appears here: undefined method `gmaps' for #<Contact:0xa4a12bc>. So i just clear the table.
    Contact.delete_all
    # Contact.create( :chirch_name => "Преображение во Христе",
    #                 :address => "г. Москва, метро Савеловская, ул. Сущевский вал, д.3/5",
    #                 :google_map => "<iframe width=\"640\" height=\"480\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=ru&amp;geocode=&amp;q=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0,+%D0%BC%D0%B5%D1%82%D1%80%D0%BE+%D0%A1%D0%B0%D0%B2%D0%B5%D0%BB%D0%BE%D0%B2%D1%81%D0%BA%D0%B0%D1%8F,+%D1%83%D0%BB.%D0%A1%D1%83%D1%89%D0%B5%D0%B2%D1%81%D0%BA%D0%B8%D0%B9+%D0%B2%D0%B0%D0%BB+%D0%B4.3%2F5&amp;aq=&amp;sll=55.793513,37.590805&amp;sspn=0.003607,0.011362&amp;t=m&amp;ie=UTF8&amp;hq=&amp;hnear=%D1%83%D0%BB.+%D0%A1%D1%83%D1%89%D0%B5%D0%B2%D1%81%D0%BA%D0%B8%D0%B9+%D0%92%D0%B0%D0%BB,+3%2F5,+%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0,+%D0%A0%D0%BE%D1%81%D1%81%D0%B8%D1%8F,+127018&amp;ll=55.793465,37.590537&amp;spn=0.011581,0.027466&amp;z=15&amp;iwloc=A&amp;output=embed\"></iframe><br /><small><a href=\"http://maps.google.com/maps?f=q&amp;source=embed&amp;hl=ru&amp;geocode=&amp;q=%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0,+%D0%BC%D0%B5%D1%82%D1%80%D0%BE+%D0%A1%D0%B0%D0%B2%D0%B5%D0%BB%D0%BE%D0%B2%D1%81%D0%BA%D0%B0%D1%8F,+%D1%83%D0%BB.%D0%A1%D1%83%D1%89%D0%B5%D0%B2%D1%81%D0%BA%D0%B8%D0%B9+%D0%B2%D0%B0%D0%BB+%D0%B4.3%2F5&amp;aq=&amp;sll=55.793513,37.590805&amp;sspn=0.003607,0.011362&amp;t=m&amp;ie=UTF8&amp;hq=&amp;hnear=%D1%83%D0%BB.+%D0%A1%D1%83%D1%89%D0%B5%D0%B2%D1%81%D0%BA%D0%B8%D0%B9+%D0%92%D0%B0%D0%BB,+3%2F5,+%D0%9C%D0%BE%D1%81%D0%BA%D0%B2%D0%B0,+%D0%A0%D0%BE%D1%81%D1%81%D0%B8%D1%8F,+127018&amp;ll=55.793465,37.590537&amp;spn=0.011581,0.027466&amp;z=15&amp;iwloc=A\" style=\"color:#0000FF;text-align:left\">Просмотреть увеличенную карту</a></small>",
    #                 :phone => "+7 (499) 973-10-81" )
  end

  def down
    Contact.delete_all
  end
end
