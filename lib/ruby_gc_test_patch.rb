# Reduce the number of GC runs while testing.
# include it in your Test class or ActiveSupport::TestCase
#
# http://37signals.com/svn/posts/2742-the-road-to-faster-tests

module RubyGcTestPatch
  def self.included(base)
    base.class_eval do

      setup :begin_gc_deferment
      teardown :reconsider_gc_deferment

      @@last_gc_run = Time.now

      def deferred_gc_threshold
        (ENV['DEFER_GC'] || 1.0).to_f
      end
      
      def begin_gc_deferment
        GC.disable if deferred_gc_threshold > 0
      end

      def reconsider_gc_deferment
        if deferred_gc_threshold > 0 && Time.now - @@last_gc_run >= deferred_gc_threshold
          GC.enable
          GC.start
          GC.disable

          @@last_gc_run = Time.now
        end
      end

    end
  end
  
end
