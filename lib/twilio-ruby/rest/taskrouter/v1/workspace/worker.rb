##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class WorkerList < ListResource
            ##
            # Initialize the WorkerList
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The workspace_sid
            # @return [WorkerList] WorkerList
            def initialize(version, workspace_sid: nil)
              super(version)

              # Path Solution
              @solution = {workspace_sid: workspace_sid}
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workers"

              # Components
              @statistics = nil
            end

            ##
            # Lists WorkerInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [String] activity_name The activity_name
            # @param [String] activity_sid The activity_sid
            # @param [String] available The available
            # @param [String] friendly_name The friendly_name
            # @param [String] target_workers_expression The target_workers_expression
            # @param [String] task_queue_name The task_queue_name
            # @param [String] task_queue_sid The task_queue_sid
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(activity_name: :unset, activity_sid: :unset, available: :unset, friendly_name: :unset, target_workers_expression: :unset, task_queue_name: :unset, task_queue_sid: :unset, limit: nil, page_size: nil)
              self.stream(
                  activity_name: activity_name,
                  activity_sid: activity_sid,
                  available: available,
                  friendly_name: friendly_name,
                  target_workers_expression: target_workers_expression,
                  task_queue_name: task_queue_name,
                  task_queue_sid: task_queue_sid,
                  limit: limit,
                  page_size: page_size
              ).entries
            end

            ##
            # Streams WorkerInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [String] activity_name The activity_name
            # @param [String] activity_sid The activity_sid
            # @param [String] available The available
            # @param [String] friendly_name The friendly_name
            # @param [String] target_workers_expression The target_workers_expression
            # @param [String] task_queue_name The task_queue_name
            # @param [String] task_queue_sid The task_queue_sid
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(activity_name: :unset, activity_sid: :unset, available: :unset, friendly_name: :unset, target_workers_expression: :unset, task_queue_name: :unset, task_queue_sid: :unset, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(
                  activity_name: activity_name,
                  activity_sid: activity_sid,
                  available: available,
                  friendly_name: friendly_name,
                  target_workers_expression: target_workers_expression,
                  task_queue_name: task_queue_name,
                  task_queue_sid: task_queue_sid,
                  page_size: limits[:page_size],
              )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields WorkerInstance records from the API.
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
            # Retrieve a single page of WorkerInstance records from the API.
            # Request is executed immediately.
            # @param [String] activity_name The activity_name
            # @param [String] activity_sid The activity_sid
            # @param [String] available The available
            # @param [String] friendly_name The friendly_name
            # @param [String] target_workers_expression The target_workers_expression
            # @param [String] task_queue_name The task_queue_name
            # @param [String] task_queue_sid The task_queue_sid
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of WorkerInstance
            def page(activity_name: :unset, activity_sid: :unset, available: :unset, friendly_name: :unset, target_workers_expression: :unset, task_queue_name: :unset, task_queue_sid: :unset, page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'ActivityName' => activity_name,
                  'ActivitySid' => activity_sid,
                  'Available' => available,
                  'FriendlyName' => friendly_name,
                  'TargetWorkersExpression' => target_workers_expression,
                  'TaskQueueName' => task_queue_name,
                  'TaskQueueSid' => task_queue_sid,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              WorkerPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of WorkerInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of WorkerInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              WorkerPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of WorkerInstance records from the API.
            # Request is executed immediately.
            # @param [String] friendly_name The friendly_name
            # @param [String] activity_sid The activity_sid
            # @param [String] attributes The attributes
            # @return [WorkerInstance] Newly created WorkerInstance
            def create(friendly_name: nil, activity_sid: :unset, attributes: :unset)
              data = Twilio::Values.of({
                  'FriendlyName' => friendly_name,
                  'ActivitySid' => activity_sid,
                  'Attributes' => attributes,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              WorkerInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid],)
            end

            ##
            # Access the statistics
            # @return [WorkersStatisticsList]
            # @return [WorkersStatisticsContext]
            def statistics
              return WorkersStatisticsContext.new(@version, @solution[:workspace_sid],)

              @statistics ||= WorkersStatisticsList.new(@version, workspace_sid: @solution[:workspace_sid],)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Taskrouter.V1.WorkerList>'
            end
          end

          class WorkerPage < Page
            ##
            # Initialize the WorkerPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [WorkerPage] WorkerPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of WorkerInstance
            # @param [Hash] payload Payload response from the API
            # @return [WorkerInstance] WorkerInstance
            def get_instance(payload)
              WorkerInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid],)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Taskrouter.V1.WorkerPage>'
            end
          end

          class WorkerContext < InstanceContext
            ##
            # Initialize the WorkerContext
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The workspace_sid
            # @param [String] sid The sid
            # @return [WorkerContext] WorkerContext
            def initialize(version, workspace_sid, sid)
              super(version)

              # Path Solution
              @solution = {workspace_sid: workspace_sid, sid: sid,}
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/Workers/#{@solution[:sid]}"

              # Dependents
              @real_time_statistics = nil
              @cumulative_statistics = nil
              @statistics = nil
              @reservations = nil
              @worker_channels = nil
            end

            ##
            # Fetch a WorkerInstance
            # @return [WorkerInstance] Fetched WorkerInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              WorkerInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], sid: @solution[:sid],)
            end

            ##
            # Update the WorkerInstance
            # @param [String] activity_sid The activity_sid
            # @param [String] attributes The attributes
            # @param [String] friendly_name The friendly_name
            # @return [WorkerInstance] Updated WorkerInstance
            def update(activity_sid: :unset, attributes: :unset, friendly_name: :unset)
              data = Twilio::Values.of({
                  'ActivitySid' => activity_sid,
                  'Attributes' => attributes,
                  'FriendlyName' => friendly_name,
              })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              WorkerInstance.new(@version, payload, workspace_sid: @solution[:workspace_sid], sid: @solution[:sid],)
            end

            ##
            # Deletes the WorkerInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Access the real_time_statistics
            # @return [WorkersRealTimeStatisticsList]
            # @return [WorkersRealTimeStatisticsContext]
            def real_time_statistics
              WorkersRealTimeStatisticsContext.new(@version, @solution[:workspace_sid],)
            end

            ##
            # Access the cumulative_statistics
            # @return [WorkersCumulativeStatisticsList]
            # @return [WorkersCumulativeStatisticsContext]
            def cumulative_statistics
              WorkersCumulativeStatisticsContext.new(@version, @solution[:workspace_sid],)
            end

            ##
            # Access the statistics
            # @return [WorkerStatisticsList]
            # @return [WorkerStatisticsContext]
            def statistics
              WorkerStatisticsContext.new(@version, @solution[:workspace_sid], @solution[:sid],)
            end

            ##
            # Access the reservations
            # @return [ReservationList]
            # @return [ReservationContext] if sid was passed.
            def reservations(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return ReservationContext.new(@version, @solution[:workspace_sid], @solution[:sid], sid,)
              end

              unless @reservations
                @reservations = ReservationList.new(
                    @version,
                    workspace_sid: @solution[:workspace_sid],
                    worker_sid: @solution[:sid],
                )
              end

              @reservations
            end

            ##
            # Access the worker_channels
            # @return [WorkerChannelList]
            # @return [WorkerChannelContext] if sid was passed.
            def worker_channels(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return WorkerChannelContext.new(@version, @solution[:workspace_sid], @solution[:sid], sid,)
              end

              unless @worker_channels
                @worker_channels = WorkerChannelList.new(
                    @version,
                    workspace_sid: @solution[:workspace_sid],
                    worker_sid: @solution[:sid],
                )
              end

              @worker_channels
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Taskrouter.V1.WorkerContext #{context}>"
            end
          end

          class WorkerInstance < InstanceResource
            ##
            # Initialize the WorkerInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] workspace_sid The workspace_sid
            # @param [String] sid The sid
            # @return [WorkerInstance] WorkerInstance
            def initialize(version, payload, workspace_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'activity_name' => payload['activity_name'],
                  'activity_sid' => payload['activity_sid'],
                  'attributes' => payload['attributes'],
                  'available' => payload['available'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_status_changed' => Twilio.deserialize_iso8601_datetime(payload['date_status_changed']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'friendly_name' => payload['friendly_name'],
                  'sid' => payload['sid'],
                  'workspace_sid' => payload['workspace_sid'],
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {'workspace_sid' => workspace_sid, 'sid' => sid || @properties['sid'],}
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [WorkerContext] WorkerContext for this WorkerInstance
            def context
              unless @instance_context
                @instance_context = WorkerContext.new(@version, @params['workspace_sid'], @params['sid'],)
              end
              @instance_context
            end

            ##
            # @return [String] The account_sid
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The activity_name
            def activity_name
              @properties['activity_name']
            end

            ##
            # @return [String] The activity_sid
            def activity_sid
              @properties['activity_sid']
            end

            ##
            # @return [String] The attributes
            def attributes
              @properties['attributes']
            end

            ##
            # @return [Boolean] The available
            def available
              @properties['available']
            end

            ##
            # @return [Time] The date_created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date_status_changed
            def date_status_changed
              @properties['date_status_changed']
            end

            ##
            # @return [Time] The date_updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The friendly_name
            def friendly_name
              @properties['friendly_name']
            end

            ##
            # @return [String] The sid
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The workspace_sid
            def workspace_sid
              @properties['workspace_sid']
            end

            ##
            # @return [String] The url
            def url
              @properties['url']
            end

            ##
            # @return [String] The links
            def links
              @properties['links']
            end

            ##
            # Fetch a WorkerInstance
            # @return [WorkerInstance] Fetched WorkerInstance
            def fetch
              context.fetch
            end

            ##
            # Update the WorkerInstance
            # @param [String] activity_sid The activity_sid
            # @param [String] attributes The attributes
            # @param [String] friendly_name The friendly_name
            # @return [WorkerInstance] Updated WorkerInstance
            def update(activity_sid: :unset, attributes: :unset, friendly_name: :unset)
              context.update(activity_sid: activity_sid, attributes: attributes, friendly_name: friendly_name,)
            end

            ##
            # Deletes the WorkerInstance
            # @return [Boolean] true if delete succeeds, true otherwise
            def delete
              context.delete
            end

            ##
            # Access the real_time_statistics
            # @return [real_time_statistics] real_time_statistics
            def real_time_statistics
              context.real_time_statistics
            end

            ##
            # Access the cumulative_statistics
            # @return [cumulative_statistics] cumulative_statistics
            def cumulative_statistics
              context.cumulative_statistics
            end

            ##
            # Access the statistics
            # @return [statistics] statistics
            def statistics
              context.statistics
            end

            ##
            # Access the reservations
            # @return [reservations] reservations
            def reservations
              context.reservations
            end

            ##
            # Access the worker_channels
            # @return [worker_channels] worker_channels
            def worker_channels
              context.worker_channels
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.WorkerInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.WorkerInstance #{values}>"
            end
          end
        end
      end
    end
  end
end