module ActiveSupport #:nodoc:
  module CoreExtensions #:nodoc:
    module Hash #:nodoc:
      module Conversions
        # We force :dasherize to be false, since we never want
        # it true.  Thanks very much to the reader on the
        # flexiblerails Google Group who suggested this better
        # approach.
        unless method_defined? :old_to_xml
          alias_method :old_to_xml, :to_xml
          def to_xml(options = {})
            options.merge!(:dasherize => false)
            old_to_xml(options)
          end
        end
      end
    end
    module Array #:nodoc:
      module Conversions
        # We force :dasherize to be false, since we never want
        # it to be true.
        unless method_defined? :old_to_xml
          alias_method :old_to_xml, :to_xml
          def to_xml(options = {})
            options.merge!(:dasherize => false)
            old_to_xml(options)
          end
        end
      end
    end
  end
end
module ActiveRecord #:nodoc:
  module Serialization
    # We force :dasherize to be false, since we never want it to
    # be true.
    unless method_defined? :old_to_xml
      alias_method :old_to_xml, :to_xml
      def to_xml(options = {})
        options.merge!(:dasherize => false)
        old_to_xml(options)
      end
    end
  end
end
# Filters added to this controller apply to all controllers in
# the application. Likewise, all the methods added will be
# available for all controllers.
class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  include AuthenticatedSystem

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session
  # store
  # TODO - this will be uncommented once we explain sessions
  # in iteration 5.
   #protect_from_forgery :secret => 'dd92c128b5358a710545b5e755694d57'

  after_filter :flex_error_handling

  def flex_error_handling
    response.headers['Status'] = interpret_status(200) if response.headers['Status'] == interpret_status(422)
  end

  def rescue_action_in_public(exception)
    render_exception(exception)
  end
  def rescue_action_locally(exception)
    render_exception(exception)
  end

  rescue_from ActiveRecord::RecordNotFound, :with => :render_exception
  def render_exception(exception)
    render :text => "<errors><error>#{exception}</error></errors>", :status => 200
  end
end
