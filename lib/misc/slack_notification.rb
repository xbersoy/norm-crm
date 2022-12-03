module SlackNotification
  ICON      = 'norm-logo'
  URL       = 'https://norm.slack.com/services/hooks/incoming-webhook?token=XXXXX'
  USERNAME  = 'www.normcrm.com'

  class << self
    def send_notification(text, options = {})
      payload = {
        text:     text,
        username: "#{USERNAME} (#{Rails.env})",
        icon_url: ICON
      }
      payload.merge!(options)

      if !Rails.env.development? && !Rails.env.test?
        uri = URI.parse(SlackNotification::URL)
        begin
          Net::HTTP.post_form(uri, payload: payload.to_json)
        rescue Net::OpenTimeout => e
          retries ||= 0
          retries += 1
          raise e if retries > 5

          retry
        end
      elsif Rails.env.development?
        puts 'SLACK MESSAGE'
        puts payload.to_json
      end
    end
  end
end
