require 'line/bot'
require 'time'
require 'active_support/all'

def handler(event:, context:)
  message = {
    type: 'text',
    text: "翔太生存報告 #{Time.current}"
  }

  response = client.push_message(user_id, message)
  puts response

  build_response
end

private

def client
  @client ||= Line::Bot::Client.new { |config|
    config.channel_secret = ENV['LINE_CHANNEL_SECRET']
    config.channel_token = ENV['LINE_CHANNEL_TOKEN']
  }
end

def user_id
  @user_id ||= ENV['USER_ID']
end

def build_response
  output_speech = build_output_speech
  data = {
    'version' => '1.0',
    'response' => {
      'outputSpeech' => output_speech,
      'shouldEndSession' => true
    }
  }
  data
end

def build_output_speech
  output_speech = {
    'type' => 'PlainText',
    'text' => '報告が完了しました'
  }
  output_speech
end
