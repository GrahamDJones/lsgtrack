class CssColorValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return false unless value
    record.errors[attribute] << (options[:message] || 'is not a valid CSS color') \
    unless ::HexadecimalColorValidator.matches?(value) or ::WebSafeColorValidator.matches?(value)
  end
end