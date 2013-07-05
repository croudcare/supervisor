module God
  module Conditions
    class Touched < PollCondition
      attr_accessor :path
      
      def initialize
        super
      end

      def valid?        
        valid = true            
        valid &= complain("Attribute 'touched_file' must be specified", self) if path.nil?
        valid
      end                       
                        
      def test
	run_if_precondition_satisfied(false) do
 	  process_start_time < file_time
	end
      end

      private
      def satisfied?
      	!watch.pid.nil? && File.exist?(path)
      end
		
      def run_if_precondition_satisfied(default, &block)
     	return block.call if satisfied?
	return default
      end
	 
      def process_start_time
        Time.parse(`ps -o lstart  -p #{self.watch.pid} --no-heading`) 
      end               
 
      def file_time
        File.mtime(path) 
      end               

    end
  end
end
