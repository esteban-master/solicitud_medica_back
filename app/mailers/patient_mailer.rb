class PatientMailer < ApplicationMailer
  default from: 'estebanenriquebeltran@gmail.com'
  def account_request
    @data = params[:data]
    mail(to: 'esteban.beltran@inacapmail.cl', from: @data[:email], subject: 'Solicitud de cuenta')
  end

end
