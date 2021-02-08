class Api::V1::MessagesController < ApplicationController
  before_action :set_message, only: %i[show update destroy]

  def index
    messages = Message.all

    render json: { messages: messages }
  end

  def show
    if @message
      @message.counter += 1
      @message.save
      render json: { message: @message }
    else
      render json: { message: 404 }
    end
  end

  def create
    message = Message.new(message_params)
    message.counter = 0
    if message.save
      render json: { status: :created, message: message }
    else
      render json: { status: 401 }
    end
  end

  def update
    if @message.update(message_params)
      render json: { message: @message }
    else
      render json: { status: 401 }
    end
  end

  def destroy
    @message.destroy
    render json: { message: "message #{@message.id} deleted" }
  end

  private

  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.permit(:body)
  end
end
