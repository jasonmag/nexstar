module ApplicationHelper
  def safe_profile_url(raw_url, allowed_domains)
    return nil if raw_url.blank?

    uri = URI.parse(raw_url)

    # Only allow http/https
    return nil unless uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS)

    host = uri.host.to_s.downcase
    # Only allow specific domains (and subdomains)
    return nil unless allowed_domains.any? { |domain| host == domain || host.end_with?(".#{domain}") }

    uri.to_s
  rescue URI::InvalidURIError
    nil
  end
end
