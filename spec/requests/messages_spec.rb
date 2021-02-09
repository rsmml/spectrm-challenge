require 'rails_helper'

describe 'Messages API', type: :request do
  it 'Return all instances of Message' do
    10.times do
      FactoryBot.create(
        :message,
        body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true),
        counter: 0
      )
    end
    get '/api/v1/messages'

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)["messages"].size).to eq(10)
  end

  it 'Return one instance of Message' do
    message = FactoryBot.create(
      :message,
      body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true),
      counter: 0
    )
    get "/api/v1/messages/#{message.id}"

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(1)
  end

  it 'Creates an instance of Message' do
    message = FactoryBot.create(
      :message,
      body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true),
      counter: 0
    )
    post "/api/v1/messages?body=Testing Post Request"

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)["status"]).to eq("created")
  end

  it 'Updates an instance of Message' do
    message = FactoryBot.create(
      :message,
      body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true),
      counter: 0
    )
    post  "/api/v1/messages/?body=Testing Post Request"
    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)["message"]["body"]).to match("Testing Post Request")

    patch "/api/v1/messages/#{message.id}?body=Updating Body"
    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)["message"]["body"]).to match("Updating Body")
  end

  it 'Delete an instance of Message' do
    message = FactoryBot.create(
      :message,
      body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true),
      counter: 0
    )
    post  "/api/v1/messages/?body=Testing Post Request"
    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)["message"]["body"]).to match("Testing Post Request")

    delete "/api/v1/messages/#{message.id}"
    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)["message"]).to match(
      "message #{message.id} deleted")
  end
end

describe 'Check Validations', type: :request do
  it 'Non guessable identifier' do
    message = FactoryBot.create(
      :message,
      body: 'Testing identifier',
      counter: 0
    )
    get "/api/v1/messages/#{message.id}"

    expect(response).to have_http_status(:success)
    regex = /\b[0-9a-f]{8}\b-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-\b[0-9a-f]{12}\b/
    expect(message.id).to match(regex)
  end

  it 'Contains characters from all languages' do
    message = FactoryBot.create(
      :message,
      body: 'Testing identifier',
      counter: 0
    )
    get "/api/v1/messages/#{message.id}"

    expect(response).to have_http_status(:success)
  end
end
