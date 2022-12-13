class ExclusionArrayValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil?

    return unless value.is_a? Array

    value.reject!(&:blank?) if options.key?(:deny_blank)

    record.errors.add(attribute, :empty) if options.key?(:presence) && value.empty?

    record.errors.add(attribute, :blacklist) if value.include?(blacklist)
  end

  private

  def blacklist
    options[:in].to_s
  end
end
