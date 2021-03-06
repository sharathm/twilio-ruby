##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
# 
# frozen_string_literal: true

module Twilio
  module REST
    class Preview
      class Authy < Version
        ##
        # Initialize the Authy version of Preview
        def initialize(domain)
          super
          @version = 'Authy'
          @services = nil
        end

        ##
        # @param [String] sid A 34 character string that uniquely identifies this Service.
        # @return [Twilio::REST::Preview::Authy::ServiceContext] if sid was passed.
        # @return [Twilio::REST::Preview::Authy::ServiceList]
        def services(sid=:unset)
          if sid.nil?
            raise ArgumentError, 'sid cannot be nil'
          elsif sid == :unset
            @services ||= ServiceList.new self
          else
            ServiceContext.new(self, sid)
          end
        end

        ##
        # Provide a user friendly representation
        def to_s
          '<Twilio::REST::Preview::Authy>'
        end
      end
    end
  end
end