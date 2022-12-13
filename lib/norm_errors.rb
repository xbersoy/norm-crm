# frozen_string_literal: true

module NormErrors
  class BadRequest < StandardError
    def initialize(message = nil)
      super(message)
    end
  end

  class Conflict < StandardError
    def initialize(message = nil)
      super(message)
    end
  end
end

module NormSerializers
  class UnprocessableEntity
    attr_reader :object

    def initialize(object)
      @object = object
    end

    def as_json
      { errors: errors }
    end

    private

    def errors
      object.errors.attribute_names.map do |error_key|
        {
          source: ActiveModelSerializers::Adapter::JsonApi::Error.error_source(:pointer, error_key),
          title:  object.errors.messages[error_key].first,
          detail: object.errors.full_messages_for(error_key).first
        }
      end
    end
  end
end
