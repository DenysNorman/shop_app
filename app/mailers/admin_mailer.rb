class AdminMailer < ApplicationMailer
  default :to => AdminUser.all.map(&:email),
          :from => 'guitarheaven@guitarmail.com'

  def order_confirmation(order)
    @order = order
    mail(:subject => "Confirmation order #{@order.id}")
  end
end
