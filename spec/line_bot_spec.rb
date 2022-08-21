require_relative '../line_bot'

RSpec.describe 'line_bot.rb' do
  let(:client) { instance_double(Line::Bot::Client) }

  let(:event) { nil }

  let(:context) { nil }

  before :each do
    allow(Line::Bot::Client).to receive(:new).and_return(client)
    allow(client).to receive(:push_message)
  end

  let(:message) {
    {
      type: 'text',
      text: "翔太生存報告 #{Time.current}"
    }
  }

  it '適切なパラメーターで在庫基盤への通信(/depot/api/v1/stock_items)が実行されること' do
    handler(event: event, context: context)
    expect(client).to have_received(:push_message).with('test_user_id', message)
  end
end