require 'rails_helper'

describe 'Messages API', type: :request do
  it 'GET all instances of Message' do
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

  it 'GET one instance of Message' do
    message = FactoryBot.create(
      :message,
      body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true),
      counter: 0
    )
    get "/api/v1/messages/#{message.id}"

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(1)
  end

  it 'CREATE an instance of Message' do
    message = FactoryBot.create(
      :message,
      body: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true),
      counter: 0
    )
    post "/api/v1/messages?body=Testing Post Request"

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)["status"]).to eq("created")
  end

  it 'UPDATE an instance of Message' do
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

  it 'DELETE an instance of Message' do
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
  it 'It has a non-guessable identifier' do
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

  it 'It contains characters from all languages' do
    message = FactoryBot.create(
      :message,
      body: 'èéëï ÝÞÆÖáðé ēę̄īį̄óōǫǫ́ łńóśź ش ص ض ط ظ ع غ ЬѢЮꙖѤѦѨ 漢字文  ç è é ê î ô ã, õ, â, ê, ô, á,',
      counter: 0
    )
    get "/api/v1/messages/#{message.id}"

    expect(response).to have_http_status(:success)
    regex = /\A[\A\-]*/
    expect(message.id).to match(regex)
  end

  it 'It does not support "<html />" tags' do
    message = Message.new
    message.body = '<p>Testing</p>'
    message.validate

    expect(message.errors[:body]).to include("No HTML <tags />")
  end

  it 'It has a maximum of 255 chars' do
    message = Message.new
    message.body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."
    message.validate

    expect(message.errors[:body]).to include("is too long (maximum is 255 characters)")
  end

  it 'It allows e-mails and links' do
    message = FactoryBot.create(
      :message,
      body: "testing@rails.com https://www.lewagon.com/",
      counter: 0
    )
    get "/api/v1/messages/#{message.id}"

    expect(response).to have_http_status(:success)
  end

  it 'It has an internal counter' do
    message = FactoryBot.create(
      :message,
      body: "testing@rails.com https://www.lewagon.com/",
      counter: 0
    )
    get "/api/v1/messages/#{message.id}"

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body)["message"]["counter"].nil?).to eq(false)
    expect(JSON.parse(response.body)["message"]["counter"]).to eq(1)
  end
end
