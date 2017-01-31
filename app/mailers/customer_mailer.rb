class CustomerMailer < ApplicationMailer

  def order_confirmation(order)
    @order = order
    mail to: @order.email, subject: 'Order confirmation'
  end
end
