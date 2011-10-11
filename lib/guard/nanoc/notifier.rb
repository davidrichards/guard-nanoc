# encoding: utf-8
require 'guard'

module Guard
  class NanocNotifier

    def self.guard_message(result, duration)
      message = ''
      if result
        message << "Completed in %.1f seconds." % [duration]
      else
        message << "Site can't be compiled,\nplease check."
      end
      message
    end

    # failed | success
    def self.guard_image(result)
      icon = if result
        :success
      else
        :failed
      end
    end

    def self.notify(result, duration)
      message = guard_message(result, duration)
      image   = guard_image(result)

      ::Guard::Notifier.notify(message, :title => 'Nanoc site', :image => image)
    end

  end
end