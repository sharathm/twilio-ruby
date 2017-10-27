##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Monitor < Domain
      class V1 < Version
        class AlertList < ListResource
          ##
          # Initialize the AlertList
          # @param [Version] version Version that contains the resource
          # @return [AlertList] AlertList
          def initialize(version)
            super(version)

            # Path Solution
            @solution = {}
            @uri = "/Alerts"
          end

          ##
          # Lists AlertInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [String] log_level The log_level
          # @param [Date] start_date The start_date
          # @param [Date] end_date The end_date
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records.  If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(log_level: :unset, start_date: :unset, end_date: :unset, limit: nil, page_size: nil)
            self.stream(
                log_level: log_level,
                start_date: start_date,
                end_date: end_date,
                limit: limit,
                page_size: page_size
            ).entries
          end

          ##
          # Streams AlertInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [String] log_level The log_level
          # @param [Date] start_date The start_date
          # @param [Date] end_date The end_date
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #    guarantees to never return more than limit. Default is no limit.
          # @param [Integer] page_size Number of records to fetch per request, when
          #    not set will use the default value of 50 records. If no page_size is defined
          #    but a limit is defined, stream() will attempt to read the limit with the most
          #    efficient page size, i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(log_level: :unset, start_date: :unset, end_date: :unset, limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)

            page = self.page(
                log_level: log_level,
                start_date: start_date,
                end_date: end_date,
                page_size: limits[:page_size],
            )

            @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
          end

          ##
          # When passed a block, yields AlertInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          def each
            limits = @version.read_limits

            page = self.page(page_size: limits[:page_size],)

            @version.stream(page,
                            limit: limits[:limit],
                            page_limit: limits[:page_limit]).each {|x| yield x}
          end

          ##
          # Retrieve a single page of AlertInstance records from the API.
          # Request is executed immediately.
          # @param [String] log_level The log_level
          # @param [Date] start_date The start_date
          # @param [Date] end_date The end_date
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of AlertInstance
          def page(log_level: :unset, start_date: :unset, end_date: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
            params = Twilio::Values.of({
                'LogLevel' => log_level,
                'StartDate' => Twilio.serialize_iso8601_date(start_date),
                'EndDate' => Twilio.serialize_iso8601_date(end_date),
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            })
            response = @version.page(
                'GET',
                @uri,
                params
            )
            AlertPage.new(@version, response, @solution)
          end

          ##
          # Retrieve a single page of AlertInstance records from the API.
          # Request is executed immediately.
          # @param [String] target_url API-generated URL for the requested results page
          # @return [Page] Page of AlertInstance
          def get_page(target_url)
            response = @version.domain.request(
                'GET',
                target_url
            )
            AlertPage.new(@version, response, @solution)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.Monitor.V1.AlertList>'
          end
        end

        class AlertPage < Page
          ##
          # Initialize the AlertPage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [AlertPage] AlertPage
          def initialize(version, response, solution)
            super(version, response)

            # Path Solution
            @solution = solution
          end

          ##
          # Build an instance of AlertInstance
          # @param [Hash] payload Payload response from the API
          # @return [AlertInstance] AlertInstance
          def get_instance(payload)
            AlertInstance.new(@version, payload,)
          end

          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.Monitor.V1.AlertPage>'
          end
        end

        class AlertContext < InstanceContext
          ##
          # Initialize the AlertContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The sid
          # @return [AlertContext] AlertContext
          def initialize(version, sid)
            super(version)

            # Path Solution
            @solution = {sid: sid,}
            @uri = "/Alerts/#{@solution[:sid]}"
          end

          ##
          # Fetch a AlertInstance
          # @return [AlertInstance] Fetched AlertInstance
          def fetch
            params = Twilio::Values.of({})

            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )

            AlertInstance.new(@version, payload, sid: @solution[:sid],)
          end

          ##
          # Deletes the AlertInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            @version.delete('delete', @uri)
          end

          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.Monitor.V1.AlertContext #{context}>"
          end
        end

        class AlertInstance < InstanceResource
          ##
          # Initialize the AlertInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The sid
          # @return [AlertInstance] AlertInstance
          def initialize(version, payload, sid: nil)
            super(version)

            # Marshaled Properties
            @properties = {
                'account_sid' => payload['account_sid'],
                'alert_text' => payload['alert_text'],
                'api_version' => payload['api_version'],
                'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                'date_generated' => Twilio.deserialize_iso8601_datetime(payload['date_generated']),
                'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                'error_code' => payload['error_code'],
                'log_level' => payload['log_level'],
                'more_info' => payload['more_info'],
                'request_method' => payload['request_method'],
                'request_url' => payload['request_url'],
                'resource_sid' => payload['resource_sid'],
                'sid' => payload['sid'],
                'url' => payload['url'],
                'request_variables' => payload['request_variables'],
                'response_body' => payload['response_body'],
                'response_headers' => payload['response_headers'],
            }

            # Context
            @instance_context = nil
            @params = {'sid' => sid || @properties['sid'],}
          end

          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @return [AlertContext] AlertContext for this AlertInstance
          def context
            unless @instance_context
              @instance_context = AlertContext.new(@version, @params['sid'],)
            end
            @instance_context
          end

          ##
          # @return [String] The account_sid
          def account_sid
            @properties['account_sid']
          end

          ##
          # @return [String] The alert_text
          def alert_text
            @properties['alert_text']
          end

          ##
          # @return [String] The api_version
          def api_version
            @properties['api_version']
          end

          ##
          # @return [Time] The date_created
          def date_created
            @properties['date_created']
          end

          ##
          # @return [Time] The date_generated
          def date_generated
            @properties['date_generated']
          end

          ##
          # @return [Time] The date_updated
          def date_updated
            @properties['date_updated']
          end

          ##
          # @return [String] The error_code
          def error_code
            @properties['error_code']
          end

          ##
          # @return [String] The log_level
          def log_level
            @properties['log_level']
          end

          ##
          # @return [String] The more_info
          def more_info
            @properties['more_info']
          end

          ##
          # @return [String] The request_method
          def request_method
            @properties['request_method']
          end

          ##
          # @return [String] The request_url
          def request_url
            @properties['request_url']
          end

          ##
          # @return [String] The request_variables
          def request_variables
            @properties['request_variables']
          end

          ##
          # @return [String] The resource_sid
          def resource_sid
            @properties['resource_sid']
          end

          ##
          # @return [String] The response_body
          def response_body
            @properties['response_body']
          end

          ##
          # @return [String] The response_headers
          def response_headers
            @properties['response_headers']
          end

          ##
          # @return [String] The sid
          def sid
            @properties['sid']
          end

          ##
          # @return [String] The url
          def url
            @properties['url']
          end

          ##
          # Fetch a AlertInstance
          # @return [AlertInstance] Fetched AlertInstance
          def fetch
            context.fetch
          end

          ##
          # Deletes the AlertInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end

          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Monitor.V1.AlertInstance #{values}>"
          end

          ##
          # Provide a detailed, user friendly representation
          def inspect
            values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.Monitor.V1.AlertInstance #{values}>"
          end
        end
      end
    end
  end
end