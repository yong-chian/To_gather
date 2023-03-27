class BookingPaymentController < ApplicationController
    skip_before_action :authenticate_user!

    def index
    @booking_payments = BookingPayment.all
    end

    def show
    @booking_payment = BookingPayment.find(params[:id])
    end

end
